import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';
import 'package:solo_play_application/src/features/course/presentation/cubit/course_cubit.dart';
import 'package:solo_play_application/src/features/course/presentation/widgets/best_course_card_widget.dart';

class BestCourseCardWidgetPage extends StatelessWidget {
  final CourseModel course;
  final int rank;
  final bool showHeader;
  const BestCourseCardWidgetPage(
      {super.key,
      required this.course,
      required this.rank,
      required this.showHeader});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit(course),
      child: BestCourseCardWidget(
        rank: rank,
        course: course,
        showHeader: showHeader,
      ),
    );
  }
}
