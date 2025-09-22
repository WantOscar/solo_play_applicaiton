import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';

part 'courses_ranking_state.freezed.dart';

// sealed class CoursesRankingState extends Equatable {}

// final class InitState extends CoursesRankingState {
//   @override
//   List<Object?> get props => [];
// }

// final class LoadingState extends CoursesRankingState {
//   @override
//   List<Object?> get props => [];
// }

// final class LoadedState extends CoursesRankingState {
//   final List<CourseModel> courses;

//   LoadedState({required this.courses});
//   @override
//   List<Object?> get props => [courses];
// }

// final class ErrorState extends CoursesRankingState {
//   final String error;

//   ErrorState({required this.error});
//   @override
//   List<Object?> get props => [error];
// }

@freezed
sealed class CoursesRankingState with _$CoursesRankingState {
  const factory CoursesRankingState.init() = InitState;
  const factory CoursesRankingState.loading() = LoadingState;
  const factory CoursesRankingState.loaded({
    required List<CourseModel> courses,
  }) = LoadedState;
  const factory CoursesRankingState.error({
    required String error,
  }) = ErrorState;
}
