import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/similar_place_photo_widget.dart';

class SimilarCafePhotoView extends StatefulWidget {
  const SimilarCafePhotoView({super.key});

  @override
  State<SimilarCafePhotoView> createState() => _SimilarCafePhotoViewState();
}

class _SimilarCafePhotoViewState extends State<SimilarCafePhotoView> {
  final List<String> imagePaths = [
    'assets/images/cafe3.jpg',
    'assets/images/cafe2.jpg',
    'assets/images/cafe.jpeg',
  ];

  final controller = PageController(viewportFraction: 1.0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 현재 보여주는 카페의 비슷한 카페 레이블 및 상세 화면가기 버튼 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'mwm과 비슷한 분위기의 카페 ',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// 현재 보여주는 카페의 비슷한 카페 위젯 영역
          Wrap(
            spacing: 8,
            children: List.generate(
              2,
              (index) => const SimilarPlacePhotoWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
