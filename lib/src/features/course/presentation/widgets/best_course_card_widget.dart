import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/widgets/action_button_widget.dart';
import 'package:solo_play_application/src/core/widgets/bookmark_icon.dart';
import 'package:solo_play_application/src/core/widgets/slide_course_image_widget.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/rank_number_widget.dart';

class BestCourseCardWidget extends StatelessWidget {
  final int rank;
  final bool showHeader;
  final CourseModel course;
  final void Function()? onBookmarkButtonTap;

  const BestCourseCardWidget(
      {super.key,
      required this.rank,
      this.showHeader = true,
      required this.course,
      this.onBookmarkButtonTap});

  @override
  Widget build(BuildContext context) {
    /// 화면을 오른쪽에서 왼쪽으로 당겨 detail coure view로 이동할 수 있다.
    return GestureDetector(
      // onHorizontalDragEnd: (details) {
      //   if (details.primaryVelocity != null &&
      //       details.primaryVelocity! < 0 &&
      //       showHeader == true) {
      //     context.push('/rank/detailCourse', extra: {
      //       'rank': rank,
      //       'course': course,
      //     });
      //   }
      // },
      onTap: () {
        context.push(
          '/rank/detailCourse',
          extra: {
            'rank': rank,
            'course': course,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            ///
            /// 랭킹 번호, 어떤 장소인지에 대한 글 타이틀, 북마크 아이콘 영역
            /// course rank view에서만 헤더가 보이도록 설정
            showHeader
                ? CourseCardHeaderWidget(
                    course: course,
                    rank: rank,
                    isBookmarked: course.isFavorite,
                    onTap: () {
                      if (onBookmarkButtonTap == null) return;
                      onBookmarkButtonTap!();
                    },
                  )
                : Container(),

            const SizedBox(height: 10),

            ///
            /// 코스 랭킹 사진들을 볼 수 있는 영역
            /// 코스 랭킹 장소의 사진 list (최소 3장 ~ 최대 5장)
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SlideCourseImageWidget(
                      images: course.images,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            ///
            /// 태그 영역
            showHeader
                ? Container()
                : PrimaryBadgeWidget(
                    text: '혼자는 아직 힘들어 LV.1',
                  ),

            const SizedBox(height: 10),

            ///
            /// 장소 상세 설명 영역
            showHeader
                ? Container()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      course.description,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      maxLines: 3,
                    ),
                  ),
            const SizedBox(height: 10),

            ////
            /// 길찾기, 공유하기 버튼 영역
            /// detail rank ui에서만 보이도록 설정
            showHeader
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// 길찾기 버튼
                        ActionButtonWidget(
                            onTap: () {},
                            image: 'assets/images/direction_icon.png',
                            text: '길찾기'),

                        /// 공유하기 버튼
                        ActionButtonWidget(
                            onTap: () {},
                            image: 'assets/images/share_icon.png',
                            text: '공유하기'),
                      ],
                    ),
                  ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

/// 카드의 헤더 부분
class CourseCardHeaderWidget extends StatelessWidget {
  final CourseModel course;
  final int rank;
  final void Function()? onTap;
  final bool isBookmarked;
  const CourseCardHeaderWidget(
      {super.key,
      required this.course,
      required this.rank,
      this.onTap,
      required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                /// 랭킹 순위 번호
                RankNumberWidget(rank: rank),

                /// 어떤 카페인지 말해주는 설명
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      course.name,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          /// 북마크 아이콘
          /// 아이콘을 클릭하면 랭킹에 있는 장소를 저장하여
          /// 저장을 모아두는 곳에서 확인 가능
          BookmarkIcon(
            onTap: onTap,
            isBookmarked: isBookmarked,
          ),
        ],
      ),
    );
  }
}
