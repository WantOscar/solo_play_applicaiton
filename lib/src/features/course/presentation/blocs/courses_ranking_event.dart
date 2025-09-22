import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';

part 'courses_ranking_event.freezed.dart';

// sealed class CoursesRankingEvent extends Equatable {}

// final class FetchInitialDatas extends CoursesRankingEvent {
//   @override
//   List<Object?> get props => [];
// }

// final class UserCourseFavoriteChanged extends CoursesRankingEvent {
//   final CourseModel course;

//   UserCourseFavoriteChanged({required this.course});
//   @override
//   List<Object?> get props => [course];
// }

@freezed
sealed class CoursesRankingEvent with _$CoursesRankingEvent {
  const factory CoursesRankingEvent.fetchInitialDatas() = FetchInitialDatas;
  const factory CoursesRankingEvent.userCourseFavoriteChanged({
    required CourseModel course,
  }) = UserCourseFavoriteChanged;
  const factory CoursesRankingEvent.courseBookmarkToggle({
    required CourseModel course,
  }) = CourseBookmarkToggle;
}
