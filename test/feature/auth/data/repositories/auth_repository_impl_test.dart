import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/jwt_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/login_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:test/test.dart';

class MockAuthDatasource extends Mock implements AuthDatasource {}

class MockJwtStorage extends Mock implements JwtStorage {}

void main() {
  group(AuthRepository, () {
    late MockAuthDatasource mockAuthDatasource;
    late MockJwtStorage mockJwtStorage;
    late AuthRepository authRepository;
    late StreamController<String?> tokenController;

    setUp(() {
      mockAuthDatasource = MockAuthDatasource();
      mockJwtStorage = MockJwtStorage();
      tokenController = StreamController<String?>.broadcast();

      // Mock the tokenStream getter
      when(() => mockJwtStorage.tokenStream)
          .thenAnswer((_) => tokenController.stream);

      authRepository = AuthRepositoryImpl(
          authDatasource: mockAuthDatasource, jwtStorage: mockJwtStorage);
    });

    tearDown(() {
      tokenController.close();
    });

    group('authStatusStream', () {
      test('emits authenticated when token is not null', () {
        final stream = authRepository.authStatusStream;

        expect(
          stream,
          emitsInOrder([
            AuthenticateStatus.unauthenticated, // Initial state from null
            AuthenticateStatus.authenticated,
          ]),
        );

        tokenController.add(null); // Initial state
        tokenController.add('some_token'); // Authenticated
      });

      test('emits unauthenticated when token is null', () {
        final stream = authRepository.authStatusStream;

        expect(
          stream,
          emitsInOrder([
            AuthenticateStatus.authenticated, // Initial state
            AuthenticateStatus.unauthenticated,
          ]),
        );

        tokenController.add('some_token'); // Initial state
        tokenController.add(null); // Unauthenticated
      });
    });

    group('dispose', () {
      test('calls dispose on jwtStorage', () {
        when(() => mockJwtStorage.dispose()).thenAnswer((_) {});

        authRepository.dispose();

        verify(() => mockJwtStorage.dispose()).called(1);
      });
    });

    group('when called checkEmailDuplicate', () {
      test('should return correctly when success', () async {
        final email = "test@test.com";
        final CheckEmailDuplicateRequest checkEmailDuplicate =
            CheckEmailDuplicateRequest(email: email);
        when(
          () => mockAuthDatasource.checkEmailDuplicate(checkEmailDuplicate),
        ).thenAnswer((_) async => Success("사용 가능한 이메일입니다!"));

        final result = await authRepository.checkEmailDuplicate(email);

        verify(
          () => mockAuthDatasource.checkEmailDuplicate(checkEmailDuplicate),
        ).called(1);

        expect(result, isA<Success>());
        expect((result as Success).value, "사용 가능한 이메일입니다!");
      });

      test('should return correctly when failure', () async {
        final email = "test@test.com";
        final CheckEmailDuplicateRequest checkEmailDuplicate =
            CheckEmailDuplicateRequest(email: email);
        when(
          () => mockAuthDatasource.checkEmailDuplicate(checkEmailDuplicate),
        ).thenAnswer((_) async => Failure("이미 있는 아이디에요."));

        final result = await authRepository.checkEmailDuplicate(email);

        verify(
          () => mockAuthDatasource.checkEmailDuplicate(checkEmailDuplicate),
        ).called(1);

        expect(result, isA<Failure>());
        expect((result as Failure).message, "이미 있는 아이디에요.");
      });
    });

    group('when called login', () {
      test('should return success correctly', () async {
        final request =
            LoginRequest(email: "test@test.com", password: "password");

        when(
          () => mockJwtStorage.saveAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockJwtStorage.saveRefreshToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockAuthDatasource.login(request),
        ).thenAnswer((_) async => Success(Jwt(
            grantType: "Bearer",
            accessToken: 'access-token',
            refreshToken: 'refresh-token')));

        final result = await authRepository
            .login(LoginInfo(email: "test@test.com", password: "password"));

        expect(result is Success, true);
        expect((result as Success).value, isNull);

        verify(() => mockAuthDatasource.login(request)).called(1);
      });

      test('should return failure correctly', () async {
        final request =
            LoginRequest(email: "test@test.com", password: "password");

        when(
          () => mockJwtStorage.saveAccessToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockJwtStorage.saveRefreshToken(any()),
        ).thenAnswer((_) async {});
        when(
          () => mockAuthDatasource.login(request),
        ).thenAnswer((_) async => Failure("가입되지 않은 이메일이거나, 비밀번호가 올바르지 않습니다."));

        final result = await authRepository
            .login(LoginInfo(email: "test@test.com", password: "password"));

        expect(result is Failure, true);
        expect((result as Failure).message, "가입되지 않은 이메일이거나, 비밀번호가 올바르지 않습니다.");

        verify(() => mockAuthDatasource.login(request)).called(1);
      });
    });

    group('when called getAccessToken', () {
      test('should return access token user logined', () async {
        when(
          () => mockJwtStorage.readAccessToken(),
        ).thenAnswer((_) async => "access-token");

        final accessToken = await authRepository.getAccessToken();

        verify(
          () => mockJwtStorage.readAccessToken(),
        ).called(1);

        expect(accessToken, "access-token");
      });

      test('should return null user not logined', () async {
        when(
          () => mockJwtStorage.readAccessToken(),
        ).thenAnswer((_) async {
          return null;
        });

        final accessToken = await authRepository.getAccessToken();

        verify(
          () => mockJwtStorage.readAccessToken(),
        ).called(1);

        expect(accessToken, isNull);
      });
    });

    group('when called sendVerificationEmail', () {
      test('should return correctly when success', () async {
        final email = "test@test.com";
        final request = EmailVerificationRequest(email: email);
        when(
          () => mockAuthDatasource.sendVerificationEmail(request),
        ).thenAnswer((_) async => Success('message'));

        final result = await authRepository.sendVerificationEmail(email);

        verify(
          () => mockAuthDatasource.sendVerificationEmail(request),
        ).called(1);

        expect(result, isA<Success>());
      });

      test('should return correctly when failure', () async {
        final email = "test@test.com";
        final request = EmailVerificationRequest(email: email);
        when(
          () => mockAuthDatasource.sendVerificationEmail(request),
        ).thenAnswer((_) async => Failure('error'));

        final result = await authRepository.sendVerificationEmail(email);

        verify(
          () => mockAuthDatasource.sendVerificationEmail(request),
        ).called(1);

        expect(result, isA<Failure>());
      });
    });
  });
}
