import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';

class RegisterCompleteButtonSection extends StatelessWidget {
  const RegisterCompleteButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: () {
        // 회원가입 API
        context.pop();
      },
      child: Text(
        '시작하기',
        style: const TextStyle(
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
