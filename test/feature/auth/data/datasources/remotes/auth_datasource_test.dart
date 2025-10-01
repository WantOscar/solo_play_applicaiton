import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource_impl.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/models/register_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code.dart';
import 'package:solo_play_application/src/features/auth/data/utils/api_path.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

class FakeCheckEmailDuplicateRequest extends Fake
    implements CheckEmailDuplicateRequest {}

class FakeLoginRequest extends Fake implements LoginRequest {}

class FakeRegisterRequest extends Fake implements RegisterRequest {}

class FakeEmailVerificationRequest extends Fake
    implements EmailVerificationRequest {}

class FakeVerifyCodeRequest extends Fake implements VerifyCodeRequest {}

void main() {
  final defaultUserAgreement = UserAgreementDto(
    isOver14: true,
    isAgreedToTerms: true,
    isAgreedToMarketing: true,
    isConsentedToAds: true,
  );
  setUpAll(() {
    registerFallbackValue(FakeCheckEmailDuplicateRequest());
    registerFallbackValue(FakeLoginRequest());
    registerFallbackValue(FakeRegisterRequest());
    registerFallbackValue(FakeEmailVerificationRequest());
    registerFallbackValue(FakeVerifyCodeRequest());
  });
  group(AuthDatasourceImpl, () {
    late MockDio mockDio;
    late AuthDatasourceImpl authDatasourceImpl;

    group('when call "/api/auth/check-email-duplicate"', () {
      setUp(() {
        mockDio = MockDio();
        authDatasourceImpl = AuthDatasourceImpl(dio: mockDio);
      });
      test('should returns success with data when statusCode == 200', () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");

        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
                queryParameters: {'email': request.email}))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  data: {
                    "status": "SUCCESS",
                    "message": "사용 가능한 이메일입니다.",
                    "data": "",
                  },
                  statusCode: 200,
                ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);
        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: {'email': request.email})).called(1);

        expect(result is Success, true);
        expect((result as Success).value, "사용 가능한 이메일입니다.");
      });

      test('should return failure with message when statusCode == 409',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");

        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: {'email': request.email})).thenThrow(DioException(
          requestOptions: RequestOptions(path: ""),
          response: Response(
            requestOptions: RequestOptions(path: ""),
            statusCode: 409,
            data: {
              "status": "ERROR",
              "message": "이미 사용 중인 이메일입니다.",
            },
          ),
          type: DioExceptionType.badResponse,
        ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: {'email': request.email})).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "이미 사용 중인 이메일입니다.");
      });

      test('should return failure with message when statusCode == 400',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");

        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: {'email': request.email})).thenThrow(DioException(
          requestOptions: RequestOptions(path: ""),
          response: Response(
            requestOptions: RequestOptions(path: ""),
            statusCode: 400,
            data: {
              "status": "ERROR",
              "message": "잘못된 요청입니다.",
            },
          ),
          type: DioExceptionType.badResponse,
        ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: {'email': request.email})).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "알 수 없는 오류가 발생했습니다.");
      });

      test(
          'should return generic network error when DioException has other status codes',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
              requestOptions: RequestOptions(path: ''), statusCode: 404),
        ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        expect((result as Failure).message, "서버와의 연결이 원할하지 않습니다");
      });

      test(
          'should return failure with message when DioException with no response (network error) occurs',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");
        final dioException = DioException(
          requestOptions: RequestOptions(path: ""),
          type: DioExceptionType.connectionError,
        );
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).thenThrow(dioException);

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "네트워크 연결을 확인해주세요.");
      });

      test('should return failure with message when an unexpected error occurs',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");
        final unexpectedException = Exception("Something went wrong");
        when(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).thenThrow(unexpectedException);

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        verify(() => mockDio.get(AuthApiPath.checkEmailDuplicate,
            queryParameters: request.toJson())).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message,
            "예상치 못한 오류가 발생했습니다: Exception: Something went wrong");
      });
    });

    group('when call /api/auth/login', () {
      setUp(() {
        mockDio = MockDio();
        authDatasourceImpl = AuthDatasourceImpl(dio: mockDio);
      });

      test('should returns success with data when statusCode == 200', () async {
        final request =
            LoginRequest(email: 'test@test.com', password: 'test-password');
        when(
          () => mockDio.post(AuthApiPath.login, data: request.toJson()),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ""),
              data: {
                "status": "SUCCESS",
                "message": "로그인에 성공했습니다.",
                "data": {
                  "grantType": "Bearer",
                  "accessToken": "test-access-key",
                  "refreshToken": "test-refresh-key"
                }
              },
              statusCode: 200,
            ));

        final result = await authDatasourceImpl.login(request);

        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);

        expect(result is Success, true);
        final success = result as Success<Jwt>;
        expect(success.value.accessToken, "test-access-key");
        expect(success.value.refreshToken, "test-refresh-key");
      });

      test(
          'should return failure with unknown format message when error response is not a map',
          () async {
        final request =
            LoginRequest(email: 'test@test.com', password: 'test-password');
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Invalid JSON', // Not a map
            statusCode: 400,
          ),
        ));

        final result = await authDatasourceImpl.login(request);

        expect((result as Failure).message, "알 수 없는 서버 응답 형식입니다.");
      });

      test(
          'should return failure with message when DioException with no response (network error) occurs',
          () async {
        final request =
            LoginRequest(email: 'test@test.com', password: 'test-password');
        final dioException = DioException(
          requestOptions: RequestOptions(path: ""),
          type: DioExceptionType.connectionError,
        );
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(dioException);

        final result = await authDatasourceImpl.login(request);

        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "네트워크 연결을 확인해주세요.");
      });

      test('should return failure with message when an unexpected error occurs',
          () async {
        final request =
            LoginRequest(email: 'test@test.com', password: 'test-password');
        final unexpectedException = Exception("Something went wrong");
        when(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .thenThrow(unexpectedException);

        final result = await authDatasourceImpl.login(request);

        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);

        expect(result is Failure, true);
        expect((result as Failure).message,
            "예상치 못한 오류가 발생했습니다: Exception: Something went wrong");
      });
    });

    group('when call /api/auth/signup', () {
      setUp(() {
        mockDio = MockDio();
        authDatasourceImpl = AuthDatasourceImpl(dio: mockDio);
      });

      test('should return success with message when statusCode == 200',
          () async {
        final request = RegisterRequest(
            agreement: defaultUserAgreement,
            email: 'test@test.com',
            password: 'test-password',
            proofToken: 'test-proof-token');
        when(
          () => mockDio.post(AuthApiPath.signup, data: request.toJson()),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ""),
              data: {
                "status": "SUCCESS",
                "message": "회원가입에 성공했습니다.",
                "data": null
              },
              statusCode: 200,
            ));

        final result = await authDatasourceImpl.register(request);

        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);

        expect(result, isA<Success>());
        expect((result as Success<String>).value, "회원가입에 성공했습니다.");
      });

      test('should return failure when status code is not 200', () async {
        final request = RegisterRequest(
            agreement: defaultUserAgreement,
            email: 'test@test.com',
            password: 'test-password',
            proofToken: 'test-proof-token');
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ''),
                  data: {'message': 'Created'},
                  statusCode: 201,
                ));

        final result = await authDatasourceImpl.register(request);

        expect((result as Failure).message, 'Created');
      });

      test('should return failure for non-400 DioException', () async {
        final request = RegisterRequest(
            agreement: defaultUserAgreement,
            email: 'test@test.com',
            password: 'test-password',
            proofToken: 'test-proof-token');
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
              requestOptions: RequestOptions(path: ''),
              data: {'message': 'Server Error'},
              statusCode: 500),
        ));

        final result = await authDatasourceImpl.register(request);

        expect((result as Failure).message, '알 수 없는 오류가 발생했습니다.');
      });

      test(
          'should return failure with message when DioException with no response (network error) occurs',
          () async {
        final request = RegisterRequest(
            agreement: defaultUserAgreement,
            email: 'test@test.com',
            password: 'test-password',
            proofToken: 'test-proof-token');
        final dioException = DioException(
          requestOptions: RequestOptions(path: ""),
          type: DioExceptionType.connectionError,
        );
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(dioException);

        final result = await authDatasourceImpl.register(request);

        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "네트워크 연결을 확인해주세요.");
      });

      test('should return failure with message when an unexpected error occurs',
          () async {
        final request = RegisterRequest(
            agreement: defaultUserAgreement,
            email: 'test@test.com',
            password: 'test-password',
            proofToken: 'test-proof-token');
        final unexpectedException = Exception("Something went wrong");
        when(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .thenThrow(unexpectedException);

        final result = await authDatasourceImpl.register(request);

        verify(() => mockDio.post(AuthApiPath.signup, data: request.toJson()))
            .called(1);

        expect(result is Failure, true);
        expect((result as Failure).message,
            "예상치 못한 오류가 발생했습니다: Exception: Something went wrong");
      });
    });

    group('when call /api/auth/send-verification-email', () {
      setUp(() {
        mockDio = MockDio();
        authDatasourceImpl = AuthDatasourceImpl(dio: mockDio);
      });

      test('should return success with message when statusCode == 200',
          () async {
        final request = EmailVerificationRequest(email: 'test@test.com');
        when(
          () => mockDio.post(AuthApiPath.sendVerificationEmail,
              data: request.toJson()),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ""),
              data: {
                "status": "SUCCESS",
                "message": "인증 이메일이 전송되었습니다.",
                "data": "",
              },
              statusCode: 200,
            ));

        final result = await authDatasourceImpl.sendVerificationEmail(request);

        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);

        expect(result is Success, true);
        expect((result as Success).value, "인증 이메일이 전송되었습니다.");
      });

      test('should return failure when status code is not 200', () async {
        final request = EmailVerificationRequest(email: 'test@test.com');
        when(() =>
            mockDio.post(AuthApiPath.sendVerificationEmail,
                data: request.toJson())).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ''),
              data: {'message': 'Accepted'},
              statusCode: 202,
            ));

        final result = await authDatasourceImpl.sendVerificationEmail(request);

        expect((result as Failure).message, 'Accepted');
      });

      test(
          'should return failure with unknown format message when error response is not a map',
          () async {
        final request = EmailVerificationRequest(email: 'test@test.com');
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: 'Invalid JSON',
            statusCode: 400,
          ),
        ));

        final result = await authDatasourceImpl.sendVerificationEmail(request);

        expect((result as Failure).message, "알 수 없는 서버 응답 형식입니다.");
      });

      test(
          'should return failure with message when DioException with no response (network error) occurs',
          () async {
        final request = EmailVerificationRequest(email: 'test@test.com');
        final dioException = DioException(
          requestOptions: RequestOptions(path: ""),
          type: DioExceptionType.connectionError,
        );
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).thenThrow(dioException);

        final result = await authDatasourceImpl.sendVerificationEmail(request);

        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "네트워크 연결을 확인해주세요.");
      });

      test('should return failure with message when an unexpected error occurs',
          () async {
        final request = EmailVerificationRequest(email: 'test@test.com');
        final unexpectedException = Exception("Something went wrong");
        when(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).thenThrow(unexpectedException);

        final result = await authDatasourceImpl.sendVerificationEmail(request);

        verify(() => mockDio.post(AuthApiPath.sendVerificationEmail,
            data: request.toJson())).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message,
            "예상치 못한 오류가 발생했습니다: Exception: Something went wrong");
      });
    });

    group('when call /api/auth/verify-code', () {
      setUp(() {
        mockDio = MockDio();
        authDatasourceImpl = AuthDatasourceImpl(dio: mockDio);
      });

      test(
          'should return success with VerifyCodeResponse when statusCode == 200',
          () async {
        final request =
            VerifyCodeRequest(email: 'test@test.com', code: '123456');
        final responsePayload = {
          "isVerified": true,
          "proofToken": "some_proof_token"
        };

        when(() => mockDio
                .post(AuthApiPath.checkVerifyCode, data: request.toJson()))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  data: {
                    "status": "SUCCESS",
                    "message": "인증에 성공했습니다.",
                    "data": responsePayload,
                  },
                  statusCode: 200,
                ));

        final result = await authDatasourceImpl.verifyCode(request);

        verify(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: request.toJson())).called(1);

        expect(result, isA<Success>());
        final successResult = result as Success<VerifyCodeResponse>;
        expect(successResult.value.proofToken, "some_proof_token");
      });

      test('should return failure with message for DioException', () async {
        final request =
            VerifyCodeRequest(email: 'test@test.com', code: '123456');
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: request.toJson())).thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            requestOptions: RequestOptions(path: ''),
            data: {'message': 'Invalid code'},
            statusCode: 400,
          ),
        ));

        final result = await authDatasourceImpl.verifyCode(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, 'Invalid code');
      });

      test('should return failure for network error', () async {
        final request =
            VerifyCodeRequest(email: 'test@test.com', code: '123456');
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
                data: request.toJson()))
            .thenThrow(DioException(
                requestOptions: RequestOptions(path: ''),
                type: DioExceptionType.connectionError));

        final result = await authDatasourceImpl.verifyCode(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message, '네트워크 연결을 확인해주세요.');
      });

      test('should return failure for unexpected error', () async {
        final request =
            VerifyCodeRequest(email: 'test@test.com', code: '123456');
        when(() => mockDio.post(AuthApiPath.checkVerifyCode,
            data: request.toJson())).thenThrow(Exception('Unexpected error'));

        final result = await authDatasourceImpl.verifyCode(request);

        expect(result, isA<Failure>());
        expect((result as Failure).message,
            '예상치 못한 오류가 발생했습니다: Exception: Unexpected error');
      });
    });
  });
}
