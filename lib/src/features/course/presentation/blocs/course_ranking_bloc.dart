import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';
import 'package:solo_play_application/src/features/course/domain/repositories/course_repository.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/courses_ranking_event.dart';
import 'package:solo_play_application/src/features/course/presentation/blocs/courses_ranking_state.dart';

class CourseRankingBloc extends Bloc<CoursesRankingEvent, CoursesRankingState> {
  CourseRankingBloc({
    required this.courseRepository,
  }) : super(InitState()) {
    on<FetchInitialDatas>(_fetchInitialDatas);
    on<UserCourseFavoriteChanged>(_updateCourseData);
    on<CourseBookmarkToggle>(_courseBookmarkToggleHandler);
  }

  final CourseRepository courseRepository;

  FutureOr<void> _fetchInitialDatas(
      FetchInitialDatas event, Emitter<CoursesRankingState> emit) async {
    emit(LoadedState(
        courses: await courseRepository.getHotPlaces().then(
            (entities) => entities
                .map((entity) => CourseModel.fromEntity(entity))
                .toList(), onError: (err, stk) {
      log(err.toString());
      emit(ErrorState(error: err.toString()));
    })));
  }

  FutureOr<void> _updateCourseData(
      UserCourseFavoriteChanged event, Emitter<CoursesRankingState> emit) {
    final newCourse = event.course;
    final prev = (state as LoadedState).courses;
    // 패치 Api 수행

    emit(LoadedState(
        courses: prev.map((course) {
      if (course == newCourse) {
        return newCourse;
      }
      return course;
    }).toList()));
  }

  FutureOr<void> _courseBookmarkToggleHandler(
      CourseBookmarkToggle event, Emitter<CoursesRankingState> emit) {
    log('course bookmark toggle');

    final target = event.course;
    final prevState = (state as LoadedState);
    final prevCourses = prevState.courses;

    emit(prevState.copyWith(
        courses: prevCourses.map((course) {
      if (course == target) {
        return target.copyWith(isFavorite: !target.isFavorite);
      } else {
        return course;
      }
    }).toList()));
  }

  @override
  void onChange(Change<CoursesRankingState> change) {
    log("prev state : ${change.currentState} next state : ${change.nextState}");
    super.onChange(change);
  }
}
