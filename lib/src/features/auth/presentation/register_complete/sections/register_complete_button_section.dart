import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';

class RegisterCompleteButtonSection extends StatelessWidget {
  const RegisterCompleteButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: () {
        /// 뒤로가기로 다시 로그인 화면으로 돌아감
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
