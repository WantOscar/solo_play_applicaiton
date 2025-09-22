import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/send_verification_email_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_verify_code_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/views/verification_email_ui.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_event.dart';
import 'package:solo_play_application/src/core/utils/ticker.dart';

class VerificationEmailPage extends StatelessWidget {
  const VerificationEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<SendVerificationEmailUsecase>(
            create: (context) => SendVerificationEmailUsecaseImpl(
                authRepository: context.read<AuthRepository>())),
        RepositoryProvider<UserVerifyCodeUsecase>(
            create: (context) => UserVerifyCodeUsecaseImpl(
                authRepository: context.read<AuthRepository>())),
        BlocProvider<VerificationBloc>(
          create: (context) => VerificationBloc(
            userVerifyCodeUsecase: context.read<UserVerifyCodeUsecase>(),
            sendVerificationEmailUsecase:
                context.read<SendVerificationEmailUsecase>(),
          ),
        ),
        BlocProvider<TimerBloc>(
          create: (context) =>
              TimerBloc(ticker: Ticker())..add(TimerStarted(duration: 600)),
        ),
      ],
      child: const VerificationEmailUi(), // Use the new view widget
    );
  }
}
