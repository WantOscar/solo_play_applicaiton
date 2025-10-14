import 'package:flutter/material.dart';

class ShowTipCourseWidget extends StatelessWidget {
  const ShowTipCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0, top: 4.0, bottom: 4.0),
      child: Text(
        "tip. 더 자세한 정보는 카드를 탭해보세요.",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff666666),
        ),
      ),
    );
  }
}
