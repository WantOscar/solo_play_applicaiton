import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/bookmark_icon.dart';

class CourseMapWidget extends StatefulWidget {
  const CourseMapWidget({super.key});

  @override
  State<CourseMapWidget> createState() => _CourseMapWidgetState();
}

class _CourseMapWidgetState extends State<CourseMapWidget> {
  bool _clickedIcon = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color(0xffCACACA),
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 337,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  "지도 영역",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      '#느좋카페투어',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '용산구',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                BookmarkIcon(
                  onTap: () {
                    setState(() {
                      _clickedIcon = !_clickedIcon;
                    });
                  },
                  isBookmarked: _clickedIcon,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
