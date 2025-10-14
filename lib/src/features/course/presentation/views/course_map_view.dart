import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/course/presentation/widgets/course_map_widget.dart';

class CourseMapView extends StatelessWidget {
  const CourseMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 456,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffFFFFFF),
      ),
      child: Column(
        children: [
          /// 코스 상세 영역으로 이동 가능한 아이콘과 설명 레이블 영역
          const SizedBox(height: 10),

          // 쪼개지 말고 한번에 표시
          _header(),
          const SizedBox(height: 10),

          _mapArea(),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'mwm이 포함된 인기있는 코스에요!',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapArea() {
    return const CourseMapWidget();
  }
}
