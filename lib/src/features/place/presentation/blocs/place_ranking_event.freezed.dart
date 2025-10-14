// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_ranking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceRankingEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlaceRankingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlaceRankingEvent()';
  }
}

/// @nodoc
class $PlaceRankingEventCopyWith<$Res> {
  $PlaceRankingEventCopyWith(
      PlaceRankingEvent _, $Res Function(PlaceRankingEvent) __);
}

/// @nodoc

class FetchData implements PlaceRankingEvent {
  const FetchData();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlaceRankingEvent.fetchData()';
  }
}

/// @nodoc

class UserBookmarkToggle implements PlaceRankingEvent {
  const UserBookmarkToggle({required this.place});

  final PlaceModel place;

  /// Create a copy of PlaceRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBookmarkToggleCopyWith<UserBookmarkToggle> get copyWith =>
      _$UserBookmarkToggleCopyWithImpl<UserBookmarkToggle>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBookmarkToggle &&
            (identical(other.place, place) || other.place == place));
  }

  @override
  int get hashCode => Object.hash(runtimeType, place);

  @override
  String toString() {
    return 'PlaceRankingEvent.userBookmarkToggle(place: $place)';
  }
}

/// @nodoc
abstract mixin class $UserBookmarkToggleCopyWith<$Res>
    implements $PlaceRankingEventCopyWith<$Res> {
  factory $UserBookmarkToggleCopyWith(
          UserBookmarkToggle value, $Res Function(UserBookmarkToggle) _then) =
      _$UserBookmarkToggleCopyWithImpl;
  @useResult
  $Res call({PlaceModel place});

  $PlaceModelCopyWith<$Res> get place;
}

/// @nodoc
class _$UserBookmarkToggleCopyWithImpl<$Res>
    implements $UserBookmarkToggleCopyWith<$Res> {
  _$UserBookmarkToggleCopyWithImpl(this._self, this._then);

  final UserBookmarkToggle _self;
  final $Res Function(UserBookmarkToggle) _then;

  /// Create a copy of PlaceRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? place = null,
  }) {
    return _then(UserBookmarkToggle(
      place: null == place
          ? _self.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceModel,
    ));
  }

  /// Create a copy of PlaceRankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceModelCopyWith<$Res> get place {
    return $PlaceModelCopyWith<$Res>(_self.place, (value) {
      return _then(_self.copyWith(place: value));
    });
  }
}

/// @nodoc

class _PlaceRankingEvent implements PlaceRankingEvent {
  const _PlaceRankingEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PlaceRankingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlaceRankingEvent()';
  }
}

// dart format on
