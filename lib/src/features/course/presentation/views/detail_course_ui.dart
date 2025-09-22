import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';
import 'package:solo_play_application/src/core/widgets/bookmark_icon.dart';
import 'package:solo_play_application/src/features/course/presentation/widgets/best_course_card_widget.dart';
import 'package:solo_play_application/src/features/course/presentation/widgets/start_course_button_widget.dart';
import 'package:solo_play_application/src/features/place/presentation/view/place_visit_review_view.dart';
import 'package:solo_play_application/src/features/place/presentation/view/similar_cafe_photo_view.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/rank_number_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/routine_widget.dart';

class DetailCourseUI extends StatefulWidget {
  final int rank;
  final CourseModel course;
  const DetailCourseUI({super.key, required this.rank, required this.course});

  @override
  State<DetailCourseUI> createState() => _DetailCourseUIState();
}

class _DetailCourseUIState extends State<DetailCourseUI> {
  bool _clickedIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            /// 랭킹 순위 번호
            RankNumberWidget(rank: widget.rank),

            /// 장소의 이름 및 위치

            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  '혼자 가도 좋은, 조용한 커피 한 잔의 시간',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            RoutineWidget(),
            const SizedBox(height: 12),
            BestCourseCardWidget(
                rank: widget.rank, showHeader: false, course: widget.course),
            const SizedBox(height: 12),
            StartCourseButtonWidget(),
            const SizedBox(height: 12),
            PlaceVisitReviewView(),
            const SizedBox(height: 12),
            SimilarCafePhotoView(),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
