import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';

class RegisterFlow extends StatelessWidget {
  final Widget child;
  const RegisterFlow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<UserRegisterUsecase>(
          create: (context) => UserRegisterUsecaseImpl(
              authRepository: context.read<AuthRepository>()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(
              userRegisterUsecase: context.read<UserRegisterUsecase>()),
        ),
      ],
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {},
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: child,
          ),
        ),
      ),
    );
  }
}
