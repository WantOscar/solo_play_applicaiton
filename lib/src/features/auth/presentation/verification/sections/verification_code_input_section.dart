import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart'; // Import Cubit
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart'; // Import TimerView

class VerificationCodeInputSection extends StatelessWidget {
  const VerificationCodeInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '인증코드를 입력해주세요.',
          style: TextStyle(
            color: Colors.black, // Default text color
            fontSize: 16, // Assuming a default font size
            fontWeight: FontWeight.w400, // Assuming a default font weight
          ),
        ),
        const SizedBox(height: 6),
        PrimaryTextField(
          hintText: '123456',
          keyboardType: TextInputType.number,
          onChanged: (value) {
            context.read<VerificationCodeCubit>().updateCode(value);
          },
        ),
        const SizedBox(height: 6), // Spacing between text field and timer
        const TimerView(), // Add TimerView
      ],
    );
  }
}