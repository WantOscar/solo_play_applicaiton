import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/course_ranking_bloc.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/courses_ranking_event.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/courses_ranking_state.dart';
import 'package:solo_play_application/src/features/course/presentation/widgets/best_course_card_widget.dart';
import 'package:solo_play_application/src/features/course/presentation/widgets/show_tip_course_widget.dart';

class CourseRankingView extends HookWidget {
  const CourseRankingView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = usePageController();
    final state = context.watch<CourseRankingBloc>().state;

    switch (state) {
      /// 초기 상태
      case InitState():
        return Container();

      /// 로딩 상태
      case LoadingState():
        return Container();

      /// 로딩 완료 상태
      case LoadedState(courses: final courses):
        final bloc = context.read<CourseRankingBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// 장소에서 tip을 보여주는 고정 위젯
            const ShowTipCourseWidget(),

            /// course에서의 핫플 course card widget을 보여줌.
            /// 순위 갯수만큼 보여줌(최대 10개).
            // Expanded(
            //   child: PageView.builder(
            //     padEnds: false,
            //     controller: controller,
            //     itemCount: state.courses.length,
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (context, index) {
            //       final course = courses[index];
            //       return Align(
            //         alignment: Alignment.topCenter,
            //         child: BestCourseCardWidget(
            //           course: course,
            //           rank: index + 1,
            //           showHeader: true,
            //           onBookmarkButtonTap: () {
            //             bloc.add(CourseBookmarkToggle(course: course));
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    courses.length,
                    (index) {
                      final course = courses[index];
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: BestCourseCardWidget(
                            rank: index + 1,
                            course: course,
                            showHeader: true,
                            onBookmarkButtonTap: () {
                              bloc.add(CourseBookmarkToggle(course: course));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );

      /// 에러 상태
      case ErrorState():
        return Container();
    }
  }
}
