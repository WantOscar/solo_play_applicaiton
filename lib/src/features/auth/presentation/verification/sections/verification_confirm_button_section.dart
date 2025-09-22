import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

class VerificationConfirmButtonSection extends StatelessWidget {
  const VerificationConfirmButtonSection({super.key}); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationBloc, VerificationState>(
      builder: (context, state) {
        final bool isButtonEnabled = state.code.length == 6;
        return PrimaryButton(
          onTap: isButtonEnabled
              ? () {
                  context.push(RouterPath.verificationComplete);
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
    );
  }
}
