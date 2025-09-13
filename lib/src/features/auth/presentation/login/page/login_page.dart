import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/cubits/password_visibility_cubit.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/views/login_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<UserLoginUsecase>(
            create: (context) => UserLoginUsecaseImpl(
                authRepository: context.read<AuthRepository>())),
        BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(userLoginUsecase: context.read<UserLoginUsecase>())),
        BlocProvider<PasswordVisibilityCubit>(
            create: (context) => PasswordVisibilityCubit())
      ],
      child: LoginUI(),
    );
  }
}
