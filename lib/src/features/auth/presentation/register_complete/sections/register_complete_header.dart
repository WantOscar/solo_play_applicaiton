import 'package:flutter/material.dart';

class RegisterCompleteHeader extends StatelessWidget {
  const RegisterCompleteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '이메일 인증이',
                style: TextStyle(
                  color: const Color(0xff0070F0),
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' 완료되었습니다.',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '이제 솔플과 함께 당신만의 코스를 찾으러 가볼까요?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xff666666),
          ),
        ),
      ],
    );
  }
}