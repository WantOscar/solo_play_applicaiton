import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/check_email_duplicate_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/views/register_email_ui.dart';

class RegisterEmailPage extends StatelessWidget {
  const RegisterEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      RepositoryProvider<CheckEmailDuplicateUsecase>(
          create: (context) => CheckEmailDuplicateUsecaseImpl(
              authRepository: context.read<AuthRepository>())),
      BlocProvider<UserEmailBloc>(
          create: (context) => UserEmailBloc(
              checkEmailDuplicateUsecase:
                  context.read<CheckEmailDuplicateUsecase>()))
    ], child: RegisterEmailUI());
  }
}
