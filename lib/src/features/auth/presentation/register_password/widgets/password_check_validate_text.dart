import 'package:flutter/material.dart';

class PasswordCheckValidateText extends StatelessWidget {
  final bool isValid;
  const PasswordCheckValidateText({super.key, this.isValid = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      '✓ 비밀번호가 같습니다',
      style: TextStyle(
        fontSize: 14,
        color: isValid ? Color(0xff266FF7) : Color(0xff8e8e8e),
      ),
    );
  }
}
