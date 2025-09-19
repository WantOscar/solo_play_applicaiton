import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart';
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart';

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
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        PrimaryTextField(
          hintText: '123456',
          keyboardType: const TextInputType.numberWithOptions(),
          maxLength: 6,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (code) {
            // 사용자의 입력에 따라서 입력 인증 코드 갱신
            context.read<VerificationCodeCubit>().updateCode(code);
            if (code.length == 6) {
              FocusScope.of(context).unfocus();
            }
          },
        ),
        const SizedBox(height: 6),
        const TimerView(),
      ],
    );
  }
}
