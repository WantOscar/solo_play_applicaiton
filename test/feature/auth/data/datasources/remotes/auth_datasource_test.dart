import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource_impl.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/utils/api_path.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group(AuthDatasourceImpl, () {
    late MockDio mockDio;
    late AuthDatasourceImpl authDatasourceImpl;

    group('when call "/api/auth/check-email-duplicate', () {
      setUp(() {
        mockDio = MockDio();
        authDatasourceImpl = AuthDatasourceImpl(dio: mockDio);
      });
      test('should returns success with data when statusCode == 200', () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");

        when(() => mockDio
                .post(AuthApiPath.checkEmailDuplicate, data: request.toJson()))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  data: {
                    "status": "SUCCESS",
                    "message": "",
                    "data": "사용 가능한 이메일입니다.",
                  },
                  statusCode: 200,
                ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);
        verify(() => mockDio.post(AuthApiPath.checkEmailDuplicate,
            data: request.toJson())).called(1);

        expect(result is Success, true);
        expect((result as Success).value, "사용 가능한 이메일입니다.");
      });

      test('should return failure with message when statusCode == 409',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");

        when(() => mockDio
                .post(AuthApiPath.checkEmailDuplicate, data: request.toJson()))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  data: {
                    "status": "ERROR",
                    "message": "이미 사용 중인 이메일입니다.",
                  },
                  statusCode: 409,
                ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        verify(() => mockDio.post(AuthApiPath.checkEmailDuplicate,
            data: request.toJson())).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "이미 사용 중인 이메일입니다.");
      });

      test('should return failure with message when statusCode != 200 && 409',
          () async {
        final request = CheckEmailDuplicateRequest(email: "test@test.com");

        when(() => mockDio
                .post(AuthApiPath.checkEmailDuplicate, data: request.toJson()))
            .thenAnswer((_) async => Response(
                  requestOptions: RequestOptions(path: ""),
                  data: {
                    "status": "ERROR",
                  },
                  statusCode: 400,
                ));

        final result = await authDatasourceImpl.checkEmailDuplicate(request);

        verify(() => mockDio.post(AuthApiPath.checkEmailDuplicate,
            data: request.toJson())).called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "서버와의 연결이 원할하지 않습니다");
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

      test('should returns failure with message when statusCode == 401',
          () async {
        final request =
            LoginRequest(email: 'test@test.com', password: 'test-password');
        when(
          () => mockDio.post(AuthApiPath.login, data: request.toJson()),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ""),
              data: {
                "errorCode": "LOGIN_FAILED",
                "message": "가입되지 않은 이메일이거나, 비밀번호가 올바르지 않습니다."
              },
              statusCode: 401,
            ));

        final result = await authDatasourceImpl.login(request);

        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "가입되지 않은 이메일이거나, 비밀번호가 올바르지 않습니다.");
      });

      test('should returns failure with message when statusCode == 500',
          () async {
        final request =
            LoginRequest(email: 'test@test.com', password: 'test-password');
        when(
          () => mockDio.post(AuthApiPath.login, data: request.toJson()),
        ).thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ""),
              data: {
                "errorCode": "UNEXPECTED_ERROR",
                "message": "알 수 없는 에러가 발생했습니다."
              },
              statusCode: 500,
            ));

        final result = await authDatasourceImpl.login(request);

        verify(() => mockDio.post(AuthApiPath.login, data: request.toJson()))
            .called(1);

        expect(result is Failure, true);
        expect((result as Failure).message, "알 수 없는 에러가 발생했습니다.");
      });
    });
  });
}
