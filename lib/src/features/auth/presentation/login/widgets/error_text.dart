import 'package:flutter/material.dart';

/// 에러 메시지 텍스트 위젯
///
/// Validation 같은 에러 메시지를 랜더링 하는 위젯입니다.
class ErrorText extends StatelessWidget {
  final String errorMessage;
  const ErrorText({super.key, this.errorMessage = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(
        color: Color(0xffff0000),
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }
}
