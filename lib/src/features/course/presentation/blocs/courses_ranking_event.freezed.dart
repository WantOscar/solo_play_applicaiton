// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'courses_ranking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoursesRankingEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoursesRankingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoursesRankingEvent()';
  }
}

/// @nodoc
class $CoursesRankingEventCopyWith<$Res> {
  $CoursesRankingEventCopyWith(
      CoursesRankingEvent _, $Res Function(CoursesRankingEvent) __);
}

/// @nodoc

class FetchInitialDatas implements CoursesRankingEvent {
  const FetchInitialDatas();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchInitialDatas);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoursesRankingEvent.fetchInitialDatas()';
  }
}

/// @nodoc

class UserCourseFavoriteChanged implements CoursesRankingEvent {
  const UserCourseFavoriteChanged({required this.course});

  final CourseModel course;

  /// Create a copy of CoursesRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCourseFavoriteChangedCopyWith<UserCourseFavoriteChanged> get copyWith =>
      _$UserCourseFavoriteChangedCopyWithImpl<UserCourseFavoriteChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCourseFavoriteChanged &&
            (identical(other.course, course) || other.course == course));
  }

  @override
  int get hashCode => Object.hash(runtimeType, course);

  @override
  String toString() {
    return 'CoursesRankingEvent.userCourseFavoriteChanged(course: $course)';
  }
}

/// @nodoc
abstract mixin class $UserCourseFavoriteChangedCopyWith<$Res>
    implements $CoursesRankingEventCopyWith<$Res> {
  factory $UserCourseFavoriteChangedCopyWith(UserCourseFavoriteChanged value,
          $Res Function(UserCourseFavoriteChanged) _then) =
      _$UserCourseFavoriteChangedCopyWithImpl;
  @useResult
  $Res call({CourseModel course});

  $CourseModelCopyWith<$Res> get course;
}

/// @nodoc
class _$UserCourseFavoriteChangedCopyWithImpl<$Res>
    implements $UserCourseFavoriteChangedCopyWith<$Res> {
  _$UserCourseFavoriteChangedCopyWithImpl(this._self, this._then);

  final UserCourseFavoriteChanged _self;
  final $Res Function(UserCourseFavoriteChanged) _then;

  /// Create a copy of CoursesRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? course = null,
  }) {
    return _then(UserCourseFavoriteChanged(
      course: null == course
          ? _self.course
          : course // ignore: cast_nullable_to_non_nullable
              as CourseModel,
    ));
  }

  /// Create a copy of CoursesRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseModelCopyWith<$Res> get course {
    return $CourseModelCopyWith<$Res>(_self.course, (value) {
      return _then(_self.copyWith(course: value));
    });
  }
}

/// @nodoc

class CourseBookmarkToggle implements CoursesRankingEvent {
  const CourseBookmarkToggle({required this.course});

  final CourseModel course;

  /// Create a copy of CoursesRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseBookmarkToggleCopyWith<CourseBookmarkToggle> get copyWith =>
      _$CourseBookmarkToggleCopyWithImpl<CourseBookmarkToggle>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseBookmarkToggle &&
            (identical(other.course, course) || other.course == course));
  }

  @override
  int get hashCode => Object.hash(runtimeType, course);

  @override
  String toString() {
    return 'CoursesRankingEvent.courseBookmarkToggle(course: $course)';
  }
}

/// @nodoc
abstract mixin class $CourseBookmarkToggleCopyWith<$Res>
    implements $CoursesRankingEventCopyWith<$Res> {
  factory $CourseBookmarkToggleCopyWith(CourseBookmarkToggle value,
          $Res Function(CourseBookmarkToggle) _then) =
      _$CourseBookmarkToggleCopyWithImpl;
  @useResult
  $Res call({CourseModel course});

  $CourseModelCopyWith<$Res> get course;
}

/// @nodoc
class _$CourseBookmarkToggleCopyWithImpl<$Res>
    implements $CourseBookmarkToggleCopyWith<$Res> {
  _$CourseBookmarkToggleCopyWithImpl(this._self, this._then);

  final CourseBookmarkToggle _self;
  final $Res Function(CourseBookmarkToggle) _then;

  /// Create a copy of CoursesRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? course = null,
  }) {
    return _then(CourseBookmarkToggle(
      course: null == course
          ? _self.course
          : course // ignore: cast_nullable_to_non_nullable
              as CourseModel,
    ));
  }

  /// Create a copy of CoursesRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseModelCopyWith<$Res> get course {
    return $CourseModelCopyWith<$Res>(_self.course, (value) {
      return _then(_self.copyWith(course: value));
    });
  }
}

// dart format on
