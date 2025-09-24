import 'dart:async';

import 'package:mocktail/mocktail.dart';
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
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/login_info.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/verify_code_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:test/test.dart';

class MockAuthDatasource extends Mock implements AuthDatasource {}

class MockJwtStorage extends Mock implements JwtStorage {}

class MockProofTokenStorage extends Mock implements ProofTokenStorage {}

void main() {
  group(AuthRepository, () {
    late MockAuthDatasource mockAuthDatasource;
    late MockJwtStorage mockJwtStorage;
    late MockProofTokenStorage mockProofTokenStorage;
    late AuthRepository authRepository;
    late StreamController<String?> tokenController;

    setUp(() {
      mockAuthDatasource = MockAuthDatasource();
      mockJwtStorage = MockJwtStorage();
      mockProofTokenStorage = MockProofTokenStorage();
      tokenController = StreamController<String?>.broadcast();
      registerFallbackValue(VerifyCodeRequest(email: '', code: ''));
      registerFallbackValue(RegisterRequest(
          userAgreement: UserAgreementDto(
              isOver14: false,
              isAgreedToTerms: false,
              isAgreedToMarketing: false,
              isConsentedToAds: false),
          email: '',
          password: '',
          proofToken: ''));

      // Mock the tokenStream getter
      when(() => mockJwtStorage.tokenStream)
          .thenAnswer((_) => tokenController.stream);

      authRepository = AuthRepositoryImpl(
        authDatasource: mockAuthDatasource,
        jwtStorage: mockJwtStorage,
        proofTokenStorage: mockProofTokenStorage,
      );
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

    group('when called verifyCode', () {
      final verifyCodeInfo =
          VerifyCodeInfo(email: 'test@test.com', code: '123456');
      final verifyCodeRequest =
          VerifyCodeRequest(email: 'test@test.com', code: '123456');

      test('should save proof token when verification is successful', () async {
        const proofToken = 'test_proof_token';
        when(() => mockAuthDatasource.verifyCode(any()))
            .thenAnswer((_) async => Success(proofToken));
        when(() => mockProofTokenStorage.saveProofToken(proofToken))
            .thenAnswer((_) async => Future.value());

        final result = await authRepository.verifyCode(verifyCodeInfo);

        expect(result, isA<Success>());
        verify(() => mockAuthDatasource.verifyCode(verifyCodeRequest))
            .called(1);
        verify(() => mockProofTokenStorage.saveProofToken(proofToken))
            .called(1);
        verifyNoMoreInteractions(mockProofTokenStorage);
      });

      test('should return correctly when success', () async {
        when(() => mockAuthDatasource.verifyCode(any()))
            .thenAnswer((_) async => Success('message'));
        // Add mock for the new dependency call
        when(() => mockProofTokenStorage.saveProofToken(any()))
            .thenAnswer((_) async => Future.value());

        final result = await authRepository.verifyCode(verifyCodeInfo);

        verify(() => mockAuthDatasource.verifyCode(verifyCodeRequest))
            .called(1);

        expect(result, isA<Success>());
      });

      test('should return correctly when failure', () async {
        when(() => mockAuthDatasource.verifyCode(any()))
            .thenAnswer((_) async => Failure('error'));

        final result = await authRepository.verifyCode(verifyCodeInfo);

        verify(() => mockAuthDatasource.verifyCode(verifyCodeRequest))
            .called(1);

        expect(result, isA<Failure>());
      });
    });

    group('when called register', () {
      final userAgreement = UserAgreement(
        isOver14: true,
        isAgreedToTerms: true,
        isAgreedToMarketing: false,
        isConsentedToAds: false,
      );
      final registerInfo = Register(
        email: 'test@test.com',
        password: 'password',
        userAgreement: userAgreement,
      );
      const proofToken = 'test_proof_token';
      final registerRequest = RegisterRequest(
        email: registerInfo.email,
        password: registerInfo.password,
        userAgreement: UserAgreementDto.fromEntity(registerInfo.userAgreement),
        proofToken: proofToken,
      );

      test('should delete proof token when registration is successful',
          () async {
        // Arrange
        when(() => mockProofTokenStorage.readProofToken())
            .thenAnswer((_) async => proofToken);
        when(() => mockAuthDatasource.register(registerRequest))
            .thenAnswer((_) async => Success('회원가입 성공'));
        when(() => mockProofTokenStorage.deleteProofToken())
            .thenAnswer((_) async => Future.value());

        // Act
        final result = await authRepository.register(registerInfo);

        // Assert
        expect(result, isA<Success>());
        verify(() => mockProofTokenStorage.readProofToken()).called(1);
        verify(() => mockAuthDatasource.register(registerRequest)).called(1);
        verify(() => mockProofTokenStorage.deleteProofToken()).called(1);
        verifyNever(() => mockJwtStorage.saveAccessToken(any()));
        verifyNever(() => mockJwtStorage.saveRefreshToken(any()));
      });

      test('should return Failure when proof token is null', () async {
        // Arrange
        when(() => mockProofTokenStorage.readProofToken())
            .thenAnswer((_) async => null);

        // Act
        final result = await authRepository.register(registerInfo);

        // Assert
        expect(result, isA<Failure>());
        expect((result as Failure).message, '본인인증이 완료되지 않았습니다.');
        verify(() => mockProofTokenStorage.readProofToken()).called(1);
        verifyNever(() => mockAuthDatasource.register(any()));
      });

      test('should return Failure when datasource fails', () async {
        // Arrange
        when(() => mockProofTokenStorage.readProofToken())
            .thenAnswer((_) async => proofToken);
        when(() => mockAuthDatasource.register(registerRequest))
            .thenAnswer((_) async => Failure('이미 가입된 이메일입니다.'));

        // Act
        final result = await authRepository.register(registerInfo);

        // Assert
        expect(result, isA<Failure>());
        expect((result as Failure).message, '이미 가입된 이메일입니다.');
        verify(() => mockProofTokenStorage.readProofToken()).called(1);
        verify(() => mockAuthDatasource.register(registerRequest)).called(1);
        verifyNever(() => mockProofTokenStorage.deleteProofToken());
      });
    });

    group('when called logout', () {
      test('should call deleteAccessToken and deleteRefreshToken on jwtStorage',
          () async {
        // Arrange
        when(() => mockJwtStorage.deleteAccessToken())
            .thenAnswer((_) async => Future.value());
        when(() => mockJwtStorage.deleteRefreshToken())
            .thenAnswer((_) async => Future.value());

        // Act
        await authRepository.logout();

        // Assert
        verify(() => mockJwtStorage.deleteAccessToken()).called(1);
        verify(() => mockJwtStorage.deleteRefreshToken()).called(1);
      });
    });
  });
}
