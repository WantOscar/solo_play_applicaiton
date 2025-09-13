import 'package:flutter/material.dart';

class PasswordValidateText extends StatelessWidget {
  final bool isValid;
  const PasswordValidateText({super.key, this.isValid = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      '✓ 8-20자 이내 ✓ 대소문자,숫자,특수문자 포함',
      style: TextStyle(
        fontSize: 14,
        color: isValid ? Color(0xff266FF7) : Color(0xff8e8e8e),
      ),
    );
  }
}
