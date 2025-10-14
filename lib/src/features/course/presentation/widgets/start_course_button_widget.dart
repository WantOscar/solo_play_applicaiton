import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartCourseButtonWidget extends StatelessWidget {
  const StartCourseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 356,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xff0070f0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/direction_white_icon.svg'),
              Text(
                '코스 시작하기',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'pretendard',
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
