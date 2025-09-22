import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/models/register_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code_request.dart';

/// 인증 관련 원격 데이터 소스의 추상 클래스입니다.
///
/// 이 클래스는 인증과 관련된 외부(서버) 통신을 위한 명세를 정의합니다.
abstract class AuthDatasource {
  /// 이메일 중복 확인을 요청합니다.
  ///
  /// - [request] : 이메일 정보가 담긴 [CheckEmailDuplicateRequest] DTO
  ///
  /// ### 반환
  /// - [Success]<String> : 사용 가능한 이메일일 경우 성공 메시지 반환
  /// - [Failure]<String> : 이미 사용 중인 이메일이거나 서버 에러 발생 시 실패 메시지 반환
  Future<Result<String>> checkEmailDuplicate(
      CheckEmailDuplicateRequest request);

  /// 로그인을 요청합니다.
  ///
  /// - [request] : 이메일과 비밀번호가 담긴 [LoginRequest] DTO
  ///
  /// ### 반환
  /// - [Success]<[Jwt]> : 로그인 성공 시 JWT 토큰 정보 반환
  /// - [Failure]<String> : 로그인 실패(자격 증명 오류 등) 또는 서버 에러 발생 시 실패 메시지 반환
  Future<Result<Jwt>> login(LoginRequest request);

  Future<Result<Jwt>> register(RegisterRequest request);

  /// 본인인증 이메일 전송을 요청합니다.
  ///
  /// - [request] : 인증을 진행할 이메일 정보가 담긴 [EmailVerificationRequest] DTO
  ///
  /// ### 반환
  /// - [Success]<String> : 이메일 전송 성공 시 메시지 반환
  /// - [Failure]<String> : 이메일 전송 실패 시 메시지 반환
  Future<Result<String>> sendVerificationEmail(
      EmailVerificationRequest request);

  Future<Result<String>> verifyCode(VerifyCodeRequest request);
}
