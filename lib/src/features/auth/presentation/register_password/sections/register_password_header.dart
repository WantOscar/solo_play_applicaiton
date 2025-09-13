import 'package:flutter/material.dart';

class RegisterPasswordHeader extends StatelessWidget {
  const RegisterPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '비밀번호를 입력해주세요',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '안전한 비밀번호를 설정해주세요',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff8e8e8e),
          ),
        ),
      ],
    );
  }
}
