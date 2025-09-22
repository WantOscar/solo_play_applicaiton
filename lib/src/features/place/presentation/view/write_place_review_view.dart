import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/review_button_widget.dart';

class WritePlaceReviewView extends StatelessWidget {
  const WritePlaceReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 리뷰 남겨달라는 문구 영역
            Row(
              children: [
                Text(
                  'mwm',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0070F0),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '다녀오셨나요?',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              '리뷰로 다양한 경험을 남겨보세요!',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),

            /// 리뷰 쓰러가는 버튼 영역
            ReviewButtonWidget(),
          ],
        ),
      ),
    );
  }
}
