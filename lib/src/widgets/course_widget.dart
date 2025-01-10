import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(3, (i) => "$i");

    return Column(
      children: [
        /// 코스 지도 영역
        Container(
          width: double.infinity,
          height: 336,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
              bottom: Radius.zero,
            ),
            color: Colors.grey,
          ),
          child: Container(),
        ),

        /// 코스 태그, 위치, 영역
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.zero,
              bottom: Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 태그 영역
                const Column(
                  children: [
                    Text(
                      '#소품샵',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '연남동',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                /// 코스
                SizedBox(
                  width: 150,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        right: 20,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 130,
                        bottom: 13,
                        child: Text(
                          '+5',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
