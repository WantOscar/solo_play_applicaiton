import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solo_play_application/src/core/widgets/profile_image_widget.dart';

class ShowReviewView extends HookWidget {
  const ShowReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhotoReview = useState<bool>(false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Color(0xffFFFFFF),
      ),
      child: Column(
        children: [
          /// 글 목록에 대한 상세 설정 위젯
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 포토리뷰 토글 버튼
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeTrackColor: Color(0xff0070F0),
                        value: isPhotoReview.value,
                        onChanged: (bool newValue) {
                          isPhotoReview.value = newValue;
                        },
                      ),
                    ),
                    Text(
                      '포토리뷰만 보기',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                /// 원하는 순대로 설정하는 아이콘
                Row(
                  children: [
                    SvgPicture.asset('assets/images/linear_arrow_icon.svg'),
                    SizedBox(width: 2),
                    Text(
                      '추천순',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          /// 구분선
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          ),
          SizedBox(height: 12),

          /// 리뷰 카드 헤더 위젯
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProfileImageWidget(
                        width: 46,
                        path:
                            'https://thumb.mt.co.kr/06/2023/10/2023102207293656368_1.jpg',
                        height: 46),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '마포너구리',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 22,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff0070F0),
                              ),
                              child: Center(
                                child: Text(
                                  '리뷰 99',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              height: 22,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xffF5F5F5),
                              ),
                              child: Center(
                                child: Text(
                                  '장소 55',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff8E8E8E),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              height: 22,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xffF5F5F5),
                              ),
                              child: Center(
                                child: Text(
                                  '코스 44',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff8E8E8E),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset('assets/images/setting_icon.png'),
              ],
            ),
          ),
          SizedBox(height: 12),

          /// 리뷰 카드 별점 위젯
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/rating_icon.svg'),
                    SizedBox(width: 6),
                    Text(
                      '5',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  '2개월 전',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8E8E8E),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),

          /// 리뷰 사진 영역
          SizedBox(
            height: 200,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.network(
                          'https://cdn.idjnews.kr/news/photo/202410/206522_209051_4619.jpg'),
                    ),
                  );
                }),
          ),
          SizedBox(height: 8),

          /// 리뷰 글 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '5햇살이 잘 들어오는 창가 자리에서 커피 한 잔 하니까 마음까지 따뜻해졌어요. 인테리어도 아늑하고 조용해서 혼자 시간 보내기 딱 좋았어요. 라떼랑 당근 케이크 조합도 최고였어요!',
              maxLines: 3,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}
