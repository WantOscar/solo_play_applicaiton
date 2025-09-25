import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

class VerificationIntroButtonSection extends StatelessWidget {
  const VerificationIntroButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationBloc, VerificationState>(
      listener: (context, state) {
        if (state.status == VerificationStatus.sent) {
          log('Verification email sent successfully. Navigating to VerificationEmailPage.');
          context.push(RouterPath.verficationEmail);
        } else if (state.status == VerificationStatus.error) {
          log('Error sending verification email: ${state.errorMessage}');
        }
      },
      child: PrimaryButton(
        onTap: () {
          final email = context.read<RegisterBloc>().state.register.email;
          context.read<VerificationBloc>().add(
                VerificationEvent.verificationEmailSent(email),
              );
        },
        activeChild: const Text(
          '본인인증 하러 가기',
          style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
      ),
    );
  }
}
