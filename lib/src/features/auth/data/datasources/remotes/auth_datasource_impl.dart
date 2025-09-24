import 'package:dio/dio.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/register_request.dart';
import 'package:solo_play_application/src/features/auth/data/utils/api_path.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code_request.dart';

/// [AuthDatasource]의 구현체
///
/// 이 클래스는 서버와 통신하여 **회원가입 과정에서 이메일 중복 여부**를 확인하는 역할을 담당합니다.
/// 내부적으로 [Dio] HTTP 클라이언트를 사용하여 API 요청을 수행합니다.
///
/// 반환 값은 성공/실패를 명확히 구분할 수 있도록 [Result] 타입으로 래핑됩니다.
/// - [Success] : 요청이 정상적으로 처리된 경우 (예: 사용 가능한 이메일일 때)
/// - [Failure] : 서버에서 에러를 반환하거나, 상태 코드가 정의되지 않은 경우
class AuthDatasourceImpl extends AuthDatasource {
  /// HTTP 통신을 담당하는 [Dio] 인스턴스
  final Dio _dio;

  /// [AuthDatasourceImpl] 생성자
  ///
  /// - [dio] : 외부에서 주입받는 HTTP 클라이언트 (테스트 시 Mocking 가능)
  AuthDatasourceImpl({
    required Dio dio,
  }) : _dio = dio;

  /// 이메일 중복 확인 API 호출
  ///
  /// [CheckEmailDuplicate] DTO를 요청 본문으로 서버에 전달하여,
  /// 입력된 이메일이 사용 가능한지 여부를 검사합니다.
  ///
  /// - 요청 경로: [AuthApiPath.checkEmailDuplicate]
  /// - 요청 방식: `POST`
  ///
  /// ### 반환
  /// - [Success]<String> : 서버가 200 OK 응답을 반환한 경우
  ///   → `response.data["data"]` 필드에 담긴 문자열을 결과로 반환
  ///
  /// - [Failure]<String> : 서버가 409 Conflict 응답을 반환한 경우
  ///   → `response.data["message"]` 필드의 에러 메시지를 반환
  ///
  /// - [Failure]<String> : 기타 상태 코드이거나 예외 발생 시
  ///   → 기본 메시지 `"서버와의 연결이 원할하지 않습니다"` 반환
  ///
  @override
  Future<Result<String>> checkEmailDuplicate(
      CheckEmailDuplicateRequest request) async {
    try {
      final response = await _dio.get(AuthApiPath.checkEmailDuplicate,
          queryParameters: request.toJson());
      if (response.statusCode == 200) {
        return Success(response.data["message"] as String);
      } else {
        // This else block should ideally not be reached if Dio throws for non-2xx
        return Failure("알 수 없는 오류가 발생했습니다.");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 409) {
          return Failure(
              e.response!.data["message"] as String); // Email duplicated
        } else if (e.response!.statusCode == 400 ||
            e.response!.statusCode == 500) {
          return Failure("알 수 없는 오류가 발생했습니다."); // Unknown error
        } else {
          return Failure("서버와의 연결이 원할하지 않습니다"); // Generic network error
        }
      } else {
        // No response, e.g., network error
        return Failure("네트워크 연결을 확인해주세요.");
      }
    } catch (e) {
      return Failure("예상치 못한 오류가 발생했습니다: ${e.toString()}");
    }
  }

  /// 로그인 요청 API 호출
  ///
  /// [CheckEmailDuplicate] DTO를 요청 본문으로 서버에 전달하여,
  /// 입력된 이메일이 사용 가능한지 여부를 검사합니다.
  ///
  /// - 요청 경로: [AuthApiPath.login]
  /// - 요청 방식: `POST`
  ///
  /// ### 반환
  /// - [Success]<Json> : 서버가 200 OK 응답을 반환한 경우
  ///   → `response.data["data"]` 필드에 담긴 토큰 정보를 반환
  ///
  /// - [Failure]<String> : 서버가 401 Unauthorized 응답을 반환한 경우
  ///   → `response.data["message"]` 필드의 에러 메시지를 반환
  ///
  /// - [Failure]<String> : 기타 상태 코드이거나 예외 발생 시
  ///   → 기본 메시지 `"서버와의 연결이 원할하지 않습니다"` 반환
  ///
  @override
  Future<Result<Jwt>> login(LoginRequest request) async {
    try {
      final response =
          await _dio.post(AuthApiPath.login, data: request.toJson());

      return Success(Jwt.fromJson(response.data['data'] as JsonMap));
    } on DioException catch (e) {
      if (e.response != null) {
        final dynamic errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('message')) {
          return Failure(errorData['message'] as String);
        } else {
          return Failure("알 수 없는 서버 응답 형식입니다.");
        }
      } else {
        return Failure("네트워크 연결을 확인해주세요.");
      }
    } catch (e) {
      return Failure("예상치 못한 오류가 발생했습니다: ${e.toString()}");
    }
  }

  /// 회원가입 요청 API 호출
  ///
  /// [RegisterRequest] DTO를 요청 본문으로 서버에 전달하여,
  /// 새로운 사용자를 등록합니다.
  ///
  /// - 요청 경로: [AuthApiPath.signup]
  /// - 요청 방식: `POST`
  ///
  /// ### 반환
  /// - [Success]<Jwt> : 서버가 200 OK 응답을 반환한 경우
  ///   → `response.data["data"]` 필드에 담긴 토큰 정보를 반환
  ///
  /// - [Failure]<String> : 서버가 400 Bad Request 응답을 반환한 경우
  ///   → `response.data["message"]` 필드의 에러 메시지를 반환
  ///
  /// - [Failure]<String> : 기타 상태 코드이거나 예외 발생 시
  ///   → 기본 메시지 `"서버와의 연결이 원할하지 않습니다"` 반환
  @override
  Future<Result<String>> register(RegisterRequest request) async {
    try {
      final response =
          await _dio.post(AuthApiPath.signup, data: request.toJson());
      if (response.statusCode == 200) {
        return Success(response.data['message'] as String);
      } else {
        return Failure(response.data['message'] as String);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return Failure(e.response!.data['message'] as String);
        } else {
          return Failure("알 수 없는 오류가 발생했습니다.");
        }
      } else {
        return Failure("네트워크 연결을 확인해주세요.");
      }
    } catch (e) {
      return Failure("예상치 못한 오류가 발생했습니다: ${e.toString()}");
    }
  }

  /// 이메일 인증 코드 발송 API 호출
  ///
  /// [EmailVerificationRequest] DTO를 요청 본문으로 서버에 전달하여,
  /// 입력된 이메일로 인증 코드를 발송합니다.
  ///
  /// - 요청 경로: [AuthApiPath.sendVerificationEmail]
  /// - 요청 방식: `POST`
  ///
  /// ### 반환
  /// - [Success]<String> : 서버가 200 OK 응답을 반환한 경우
  ///   → `response.data["message"]` 필드에 담긴 성공 메시지를 반환
  ///
  /// - [Failure]<String> : 예외 발생 시
  ///   → 에러 메시지를 담아 반환
  @override
  Future<Result<String>> sendVerificationEmail(EmailVerificationRequest request) async {
    try {
      final response = await _dio.post(
        AuthApiPath.sendVerificationEmail,
        data: request.toJson(), // request.toJson() 사용
      );
      if (response.statusCode == 200) {
        return Success(response.data["message"] as String);
      } else {
        return Failure(response.data['message'] as String? ?? "알 수 없는 오류가 발생했습니다.");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final dynamic errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('message')) {
          return Failure(errorData['message'] as String);
        } else {
          return Failure("알 수 없는 서버 응답 형식입니다.");
        }
      } else {
        return Failure("네트워크 연결을 확인해주세요.");
      }
    } catch (e) {
      return Failure("예상치 못한 오류가 발생했습니다: ${e.toString()}");
    }
  }

  /// 인증 코드 검증 API 호출
  ///
  /// [VerifyCodeRequest] DTO를 요청 본문으로 서버에 전달하여,
  /// 이메일로 발송된 인증 코드의 유효성을 검사합니다.
  ///
  /// - 요청 경로: [AuthApiPath.checkVerifyCode]
  /// - 요청 방식: `POST`
  ///
  /// ### 반환
  /// - [Success]<String> : 서버가 200 OK 응답을 반환한 경우
  ///   → `response.data["message"]` 필드에 담긴 성공 메시지를 반환
  ///
  /// - [Failure]<String> : 예외 발생 시
  ///   → 에러 메시지를 담아 반환
  @override
  Future<Result<String>> verifyCode(VerifyCodeRequest request) async {
    try {
      final response = await _dio.post(
        AuthApiPath.checkVerifyCode,
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(response.data["message"] as String);
      } else {
        return Failure(response.data['message'] as String? ?? "알 수 없는 오류가 발생했습니다.");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final dynamic errorData = e.response!.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('message')) {
          return Failure(errorData['message'] as String);
        } else {
          return Failure("알 수 없는 서버 응답 형식입니다.");
        }
      } else {
        return Failure("네트워크 연결을 확인해주세요.");
      }
    } catch (e) {
      return Failure("예상치 못한 오류가 발생했습니다: ${e.toString()}");
    }
  }
}
