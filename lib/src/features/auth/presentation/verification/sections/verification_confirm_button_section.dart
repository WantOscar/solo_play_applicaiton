import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart'; // Import Cubit

class VerificationConfirmButtonSection extends StatelessWidget {
  const VerificationConfirmButtonSection({Key? key}) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCodeCubit, String>(
      builder: (context, code) {
        final bool isButtonEnabled = code.length == 6;
        return PrimaryButton(
          onTap: isButtonEnabled ? () {
            // TODO: Implement confirmation logic
            print('Confirm button pressed with code: $code');
          } : null,
          child: Text(
            '다음',
            style: TextStyle(
              color: isButtonEnabled ? const Color(0xffffffff) : const Color(0xff8e8e8e),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}