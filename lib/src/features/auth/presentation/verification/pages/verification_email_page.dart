import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart';
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
        BlocProvider<VerificationCodeCubit>(
          create: (context) => VerificationCodeCubit(),
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
