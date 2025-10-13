import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/bloc.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockUserLoginUsecase extends Mock implements UserLoginUsecase {}

class MockUserRegisterUsecase extends Mock implements UserRegisterUsecase {}

class MockAuthRepository extends Mock implements AuthRepository {}
