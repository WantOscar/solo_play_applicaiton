import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource_impl.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/models/register_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/user_agreement.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code_request.dart';
import 'package:solo_play_application/src/features/auth/data/utils/api_path.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio mockDio;
  late AuthDatasource datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = AuthDatasourceImpl(dio: mockDio);
  });

  group(AuthDatasourceImpl, () {
    group('checkEmailDuplicate', () {
      const email = 'test@test.com';
      final request = CheckEmailDuplicateRequest(email: email);
      final successResponse = {'message': '사용 가능한 이메일입니다.'};

      test('should return Success(String) when the call is successful (200 OK)',
          () async {
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: request.toJson()))
            .thenAnswer((_) async => Response(
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                data: successResponse,
                statusCode: 200));

        final result = await datasource.checkEmailDuplicate(request);

        expect(result, isA<Success>());
        expect((result as Success).value, successResponse['message']);
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);
      });

      test(
          'should return Failure(String) when status code is 409 (Email duplicated)',
          () async {
        final errorResponse = {'message': '이미 사용 중인 이메일입니다.'};
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 409,
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                response: Response(
                    requestOptions:
                        RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                    data: errorResponse,
                    statusCode: 409)));

        final result = await datasource.checkEmailDuplicate(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, errorResponse['message']);
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);
      });

      test('should return Failure(String) for 400 or 500 status codes',
          () async {
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 400,
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                response: Response(
                    requestOptions:
                        RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                    data: {},
                    statusCode: 400)));

        final result = await datasource.checkEmailDuplicate(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '알 수 없는 오류가 발생했습니다.');
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);
      });

      test('should return Failure(String) for other DioException status codes',
          () async {
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 404,
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                response: Response(
                    requestOptions:
                        RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                    data: {},
                    statusCode: 404)));

        final result = await datasource.checkEmailDuplicate(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '서버와의 연결이 원할하지 않습니다');
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);
      });

      test('should return Failure(String) for network error (no response)',
          () async {
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: request.toJson()))
            .thenThrow(DioException(
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkEmailDuplicate),
                type: DioExceptionType.connectionError));

        final result = await datasource.checkEmailDuplicate(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '네트워크 연결을 확인해주세요.');
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);
      });

      test('should return Failure(String) for unexpected error', () async {
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: request.toJson()))
            .thenThrow(Exception('Some unexpected error'));

        final result = await datasource.checkEmailDuplicate(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, contains('예상치 못한 오류가 발생했습니다'));
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);
      });
    });

    // --- login tests ---
    group('login', () {
      final request =
          LoginRequest(email: 'test@test.com', password: 'password');
      final jwtResponse = {
        'data': {
          'accessToken': 'abc',
          'refreshToken': 'def',
          'grantType': 'Bearer'
        }
      };

      test('should return Success(Jwt) when the call is successful', () async {
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: AuthApiPath.login),
                data: jwtResponse,
                statusCode: 200));

        final result = await datasource.login(request);

        expect(result, isA<Success>());
        expect((result as Success).value, isA<Jwt>());
        expect((result as Success).value.accessToken, 'abc');
        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) when DioException has message',
          () async {
        final errorResponse = {'message': 'Invalid credentials'};
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 401,
                requestOptions: RequestOptions(path: AuthApiPath.login),
                response: Response(
                    requestOptions: RequestOptions(path: AuthApiPath.login),
                    data: errorResponse,
                    statusCode: 401)));

        final result = await datasource.login(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, errorResponse['message']);
        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for unknown server response format',
          () async {
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 401,
                requestOptions: RequestOptions(path: AuthApiPath.login),
                response: Response(
                    requestOptions: RequestOptions(path: AuthApiPath.login),
                    data: 'not a map',
                    statusCode: 401)));

        final result = await datasource.login(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '알 수 없는 서버 응답 형식입니다.');
        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for network error (no response)',
          () async {
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(DioException(
                requestOptions: RequestOptions(path: AuthApiPath.login),
                type: DioExceptionType.connectionError));

        final result = await datasource.login(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '네트워크 연결을 확인해주세요.');
        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for unexpected error', () async {
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(Exception('Some unexpected error'));

        final result = await datasource.login(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, contains('예상치 못한 오류가 발생했습니다'));
        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);
      });
    });

    // --- register tests ---
    group('register', () {
      final userAgreement = UserAgreement(
          isOver14: true,
          isAgreedToTerms: true,
          isAgreedToMarketing: false,
          isConsentedToAds: false);
      final request = RegisterRequest(
          userAgreement: userAgreement,
          email: 'test@test.com',
          password: 'password',
          code: '123456');
      final jwtResponse = {
        'data': {
          'accessToken': 'abc',
          'refreshToken': 'def',
          'grantType': 'Bearer'
        }
      };

      test('should return Success(Jwt) when the call is successful (200 OK)',
          () async {
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: AuthApiPath.signup),
                data: jwtResponse,
                statusCode: 200));

        final result = await datasource.register(request);

        expect(result, isA<Success>());
        expect((result as Success).value, isA<Jwt>());
        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) when status code is not 200',
          () async {
        final errorResponse = {'message': 'Registration failed'};
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: AuthApiPath.signup),
                data: errorResponse,
                statusCode: 400));

        final result = await datasource.register(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, errorResponse['message']);
        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for 400 DioException', () async {
        final errorResponse = {'message': 'Bad request'};
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 400,
                requestOptions: RequestOptions(path: AuthApiPath.signup),
                response: Response(
                    requestOptions: RequestOptions(path: AuthApiPath.signup),
                    data: errorResponse,
                    statusCode: 400)));

        final result = await datasource.register(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, errorResponse['message']);
        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for other DioException status codes',
          () async {
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 500,
                requestOptions: RequestOptions(path: AuthApiPath.signup),
                response: Response(
                    requestOptions: RequestOptions(path: AuthApiPath.signup),
                    data: {},
                    statusCode: 500)));

        final result = await datasource.register(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '알 수 없는 오류가 발생했습니다.');
        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for network error (no response)',
          () async {
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(DioException(
                requestOptions: RequestOptions(path: AuthApiPath.signup),
                type: DioExceptionType.connectionError));

        final result = await datasource.register(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '네트워크 연결을 확인해주세요.');
        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);
      });

      test('should return Failure(String) for unexpected error', () async {
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(Exception('Some unexpected error'));

        final result = await datasource.register(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, contains('예상치 못한 오류가 발생했습니다'));
        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);
      });
    });

    // --- sendVerificationEmail tests ---
    group('sendVerificationEmail', () {
      final request = EmailVerificationRequest(email: 'test@test.com');
      final successResponse = {'message': '인증 이메일이 전송되었습니다.'};

      test('should return Success(String) when the call is successful (200 OK)',
          () async {
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
                data: request.toJson()))
            .thenAnswer((_) async => Response(
                requestOptions:
                    RequestOptions(path: AuthApiPath.sendVerificationEmail),
                data: successResponse,
                statusCode: 200));

        final result = await datasource.sendVerificationEmail(request);

        expect(result, isA<Success>());
        expect((result as Success).value, successResponse['message']);
        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);
      });

      test('should return Failure(String) when DioException has message',
          () async {
        final errorResponse = {'message': 'Email sending failed'};
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
                data: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 400,
                requestOptions:
                    RequestOptions(path: AuthApiPath.sendVerificationEmail),
                response: Response(
                    requestOptions:
                        RequestOptions(path: AuthApiPath.sendVerificationEmail),
                    data: errorResponse,
                    statusCode: 400)));

        final result = await datasource.sendVerificationEmail(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, errorResponse['message']);
        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);
      });

      test('should return Failure(String) for unknown server response format',
          () async {
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
                data: request.toJson()))
            .thenThrow(DioException.badResponse(
                statusCode: 400,
                requestOptions:
                    RequestOptions(path: AuthApiPath.sendVerificationEmail),
                response: Response(
                    requestOptions:
                        RequestOptions(path: AuthApiPath.sendVerificationEmail),
                    data: 'not a map',
                    statusCode: 400)));

        final result = await datasource.sendVerificationEmail(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '알 수 없는 서버 응답 형식입니다.');
        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);
      });

      test('should return Failure(String) for network error (no response)',
          () async {
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
                data: request.toJson()))
            .thenThrow(DioException(
                requestOptions:
                    RequestOptions(path: AuthApiPath.sendVerificationEmail),
                type: DioExceptionType.connectionError));

        final result = await datasource.sendVerificationEmail(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '네트워크 연결을 확인해주세요.');
        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);
      });

      test('should return Failure(String) for unexpected error', () async {
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
                data: request.toJson()))
            .thenThrow(Exception('Some unexpected error'));

        final result = await datasource.sendVerificationEmail(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, contains('예상치 못한 오류가 발생했습니다'));
        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);
      });
    });

    // --- verifyCode tests ---
    group('verifyCode', () {
      const verifyCodeRequest =
          VerifyCodeRequest(email: 'test@test.com', code: '123456');
      final successResponse = {'message': '인증에 성공했습니다.'};

      test('should return Success(String) when the call is successful (200 OK)',
          () async {
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data:
                verifyCodeRequest.toJson())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: AuthApiPath.checkVerifyCode),
            data: successResponse,
            statusCode: 200));

        final result = await datasource.verifyCode(verifyCodeRequest);

        expect(result, isA<Success>());
        expect((result as Success).value, successResponse['message']);
        verify(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson())).called(1);
      });

      test('should return Failure(String) when DioException has message',
          () async {
        final errorResponse = {'message': 'Invalid code'};
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data:
                verifyCodeRequest.toJson())).thenThrow(DioException.badResponse(
            statusCode: 400,
            requestOptions: RequestOptions(path: AuthApiPath.checkVerifyCode),
            response: Response(
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkVerifyCode),
                data: errorResponse,
                statusCode: 400)));

        final result = await datasource.verifyCode(verifyCodeRequest);

        expect(result, isA<Failure>());
        expect((result as Failure).message, errorResponse['message']);
        verify(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson())).called(1);
      });

      test('should return Failure(String) for unknown server response format',
          () async {
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data:
                verifyCodeRequest.toJson())).thenThrow(DioException.badResponse(
            statusCode: 400,
            requestOptions: RequestOptions(path: AuthApiPath.checkVerifyCode),
            response: Response(
                requestOptions:
                    RequestOptions(path: AuthApiPath.checkVerifyCode),
                data: 'not a map',
                statusCode: 400)));

        final result = await datasource.verifyCode(verifyCodeRequest);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '알 수 없는 서버 응답 형식입니다.');
        verify(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson())).called(1);
      });

      test('should return Failure(String) for network error (no response)',
          () async {
        when(() =>
            mockDio.post(AuthApiPath.checkVerifyCode,
                data: verifyCodeRequest.toJson())).thenThrow(DioException(
            requestOptions: RequestOptions(path: AuthApiPath.checkVerifyCode),
            type: DioExceptionType.connectionError));

        final result = await datasource.verifyCode(verifyCodeRequest);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '네트워크 연결을 확인해주세요.');
        verify(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson())).called(1);
      });

      test('should return Failure(String) for unexpected error', () async {
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
                data: verifyCodeRequest.toJson()))
            .thenThrow(Exception('Some unexpected error'));

        final result = await datasource.verifyCode(verifyCodeRequest);

        expect(result, isA<Failure>());
        expect((result as Failure).message, contains('예상치 못한 오류가 발생했습니다'));
        verify(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson())).called(1);
      });
    });
  });
}
