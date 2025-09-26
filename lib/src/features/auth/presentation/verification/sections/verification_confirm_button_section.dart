import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

class VerificationConfirmButtonSection extends StatelessWidget {
  const VerificationConfirmButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VerificationBloc, VerificationState>(
          listener: (context, state) {
            if (state.status == VerificationStatus.verified) {
              log('Verification successful. Triggering user registration.');
              context.read<RegisterBloc>().add(
                    RegisterSubmitted(),
                  );
            } else if (state.status == VerificationStatus.error) {
              log('Error verifying code: ${state.errorMessage}');
            }
          },
        ),
        BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.status == RegisterStatus.success) {
              log('User registration successful. Navigating to RegisterCompleteUI.');
              context.push(RouterPath.verificationComplete);
            } else if (state.status == RegisterStatus.error) {
              log('Error during user registration: ${state.errorMessage}');
            }
          },
        ),
      ],
      child: BlocBuilder<VerificationBloc, VerificationState>(
        builder: (context, state) {
          final bool isButtonEnabled = state.code.length == 6;
          return PrimaryButton(
            onTap: isButtonEnabled
                ? () {
                    final email =
                        context.read<RegisterBloc>().state.register.email;
                    final code = state.code;
                    context.read<VerificationBloc>().add(
                          VerificationEvent.verificationSubmitted(email, code),
                        );
                  }
                : null,
            child: Text(
              '다음',
              style: TextStyle(
                color: isButtonEnabled
                    ? const Color(0xffffffff)
                    : const Color(0xff8e8e8e),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        },
      ),
    );
  }
}
