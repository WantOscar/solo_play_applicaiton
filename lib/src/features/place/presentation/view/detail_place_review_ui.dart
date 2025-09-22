import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/features/place/presentation/view/show_review_view.dart';
import 'package:solo_play_application/src/features/place/presentation/view/write_place_review_view.dart';

class DetailPlaceReviewUI extends StatelessWidget {
  const DetailPlaceReviewUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color(0xffFFFFFF),
          ),
          child: Column(
            children: [
              AppBar(
                leading: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                elevation: 0.0,
                title: const Text(
                  'mwm 방문후기',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/rating_icon.svg',
                    width: 192,
                    height: 32,
                  ),
                  SizedBox(width: 12),
                  Text(
                    '5.0',
                    style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '999개의 리뷰',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8E8E8E),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            WritePlaceReviewView(),
            SizedBox(height: 10),
            ShowReviewView(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
