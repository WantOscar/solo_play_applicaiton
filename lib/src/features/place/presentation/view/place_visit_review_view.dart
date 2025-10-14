import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/review_card_widget.dart';

class PlaceVisitReviewView extends StatelessWidget {
  const PlaceVisitReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 331,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 방문 후기 레이블 및 상세 화면가기 버튼 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'mwm 방문 후기',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/rank/detailPlace/detailReview');
                  },
                  child: const Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ],
            ),
          ),

          /// 별점 및 리뷰 개수 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/rating_icon.svg'),
                    const SizedBox(width: 12),
                    const Text(
                      '5.0',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Text(
                  '999개의 리뷰',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8E8E8E),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),

          /// 후기 영역
          SizedBox(
            height: 262,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: ReviewCardWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
