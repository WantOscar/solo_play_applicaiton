import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/jwt_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/proof_token_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/models/register_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code_request.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/login_info.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register_info.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/verify_code_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

enum AuthenticateStatus { unknown, authenticated, unauthenticated }

/// [AuthRepository]의 구현체입니다.
///
/// 이 클래스는 원격 데이터 소스([AuthDatasource])와 로컬 데이터 소스([JwtStorage], [ProofTokenStorage])를
/// 조합하여 인증 관련 로직을 수행합니다.
class AuthRepositoryImpl extends AuthRepository {
  /// 원격 인증 데이터 소스
  final AuthDatasource _authDatasource;

  /// 로컬 JWT 토큰 저장소
  final JwtStorage _jwtStorage;

  /// 본인인증 임시 토큰 저장소
  final ProofTokenStorage _proofTokenStorage;

  /// [AuthRepositoryImpl] 생성자
  ///
  /// - [authDatasource] : 외부에서 주입받는 원격 데이터 소스
  /// - [jwtStorage] : 외부에서 주입받는 로컬 토큰 저장소
  /// - [proofTokenStorage] : 외부에서 주입받는 본인인증 토큰 저장소
  AuthRepositoryImpl({
    required AuthDatasource authDatasource,
    required JwtStorage jwtStorage,
    required ProofTokenStorage proofTokenStorage,
  })  : _authDatasource = authDatasource,
        _jwtStorage = jwtStorage,
        _proofTokenStorage = proofTokenStorage;

  /// 인증 상태 변경 감지 스트림
  ///
  /// [JwtStorage]의 `tokenStream`을 구독하여 토큰의 존재 여부에 따라
  /// [AuthenticateStatus]를 반환하는 스트림입니다.
  /// - 토큰이 있으면 [AuthenticateStatus.authenticated]
  /// - 토큰이 없으면 [AuthenticateStatus.unauthenticated]
  @override
  Stream<AuthenticateStatus> get authStatusStream {
    return _jwtStorage.tokenStream.map((token) {
      if (token != null && token.isNotEmpty) {
        return AuthenticateStatus.authenticated;
      } else {
        return AuthenticateStatus.unauthenticated;
      }
    });
  }

  /// 이메일 중복을 확인합니다.
  ///
  /// Domain 레이어에서 받은 `email` 문자열을 [CheckEmailDuplicateRequest] DTO로 감싸
  /// [AuthDatasource]에 전달합니다.
  @override
  Future<Result<String>> checkEmailDuplicate(String email) {
    return _authDatasource
        .checkEmailDuplicate(CheckEmailDuplicateRequest(email: email));
  }

  @override
  Future<Result<String>> sendVerificationEmail(String email) {
    return _authDatasource
        .sendVerificationEmail(EmailVerificationRequest(email: email));
  }

  @override
  Future<Result<String>> verifyCode(VerifyCodeInfo request) async {
    final result = await _authDatasource.verifyCode(
        VerifyCodeRequest(email: request.email, code: request.code));

    if (result is Success<String>) {
      await _proofTokenStorage.saveProofToken(result.value);
    }

    return result;
  }

  /// 로그인을 수행합니다.
  ///
  /// 1. Domain 레이어의 [LoginInfo] 엔티티를 [LoginRequest] DTO로 변환합니다.
  /// 2. 변환된 DTO를 [AuthDatasource]에 전달하여 로그인을 요청합니다.
  /// 3. 로그인 성공 시, 반환된 [Jwt] 토큰을 [JwtStorage]를 통해 로컬에 저장합니다.
  /// 4. 로그인 실패 시, 실패 결과를 그대로 반환합니다.
  @override
  Future<Result<void>> login(LoginInfo login) async {
    // 데이터 소스에 로그인 요청
    final result = await _authDatasource
        .login(LoginRequest(email: login.email, password: login.password));

    // 요청 성공 여부 확인
    if (result is Success<Jwt>) {
      // 성공 시, 반환된 Jwt 객체
      final jwt = result.value;

      // 액세스 토큰과 리프레시 토큰을 로컬에 저장
      await _jwtStorage.saveAccessToken(jwt.accessToken);
      await _jwtStorage.saveRefreshToken(jwt.refreshToken);

      // 최종 성공 결과 반환 (반환 값 없음)
      return Success(null);
    } else {
      // 실패 시, 에러 메시지를 담아 실패 결과 반환
      return Failure((result as Failure).message);
    }
  }

  @override
  Future<Result<void>> register(RegisterInfo registerInfo) async {
    // 1. Read proof token
    final proofToken = await _proofTokenStorage.readProofToken();

    // 2. Check if proof token exists
    if (proofToken == null) {
      return Failure('본인인증이 완료되지 않았습니다.');
    }

    // 3. Create request DTO
    final request = RegisterRequest(
      email: registerInfo.email,
      password: registerInfo.password,
      userAgreement: registerInfo.userAgreement,
      proofToken: proofToken,
    );

    // 4. Call datasource
    final result = await _authDatasource.register(request);

    // 5. Handle result
    if (result is Success<String>) {
      // Delete temporary proof token
      await _proofTokenStorage.deleteProofToken();
      return Success(null);
    } else {
      return Failure((result as Failure).message);
    }
  }

  /// 저장된 액세스 토큰을 불러옵니다.
  ///
  /// [JwtStorage]를 통해 로컬에 저장된 액세스 토큰을 직접 읽어옵니다.
  @override
  Future<String?> getAccessToken() {
    return _jwtStorage.readAccessToken();
  }

  /// 데이터 소스에서 사용하는 리소스를 해제합니다.
  ///
  /// 주로 [JwtStorage]의 스트림 컨트롤러를 닫기 위해 호출됩니다.
  @override
  void dispose() {
    return _jwtStorage.dispose();
  }

  @override
  Future<void> logout() async {
    await _jwtStorage.deleteAccessToken();
    await _jwtStorage.deleteRefreshToken();
  }
}
