import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/course/core/course_api_services_provider.dart';
import 'package:solo_play_application/src/features/course/core/course_repository_provider.dart';
import 'package:solo_play_application/src/features/course/domain/repositories/course_repository.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/course_ranking_bloc.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/courses_ranking_event.dart';
import 'package:solo_play_application/src/features/course/presentation/views/course_ranking_view.dart';

class CourseRankingPage extends StatelessWidget {
  const CourseRankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        courseApiServicesProvider,
        courseRepositoryProvider,
        BlocProvider(
            create: (context) => CourseRankingBloc(
                courseRepository: context.read<CourseRepository>())
              ..add(FetchInitialDatas()))
      ],
      child: CourseRankingView(),
    );
  }
}
