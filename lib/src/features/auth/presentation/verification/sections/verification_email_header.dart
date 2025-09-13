import 'package:flutter/material.dart';

class VerificationEmailHeader extends StatelessWidget {
  const VerificationEmailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '이메일',
            style: TextStyle(
              color: const Color(0xff0070F0),
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' 인증하기',
            style: TextStyle(
              color: const Color(0xff000000),
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}