// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyCodeInfo {
  String get email;
  String get code;

  /// Create a copy of VerifyCodeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyCodeInfoCopyWith<VerifyCodeInfo> get copyWith =>
      _$VerifyCodeInfoCopyWithImpl<VerifyCodeInfo>(
          this as VerifyCodeInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyCodeInfo &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() {
    return 'VerifyCodeInfo(email: $email, code: $code)';
  }
}

/// @nodoc
abstract mixin class $VerifyCodeInfoCopyWith<$Res> {
  factory $VerifyCodeInfoCopyWith(
          VerifyCodeInfo value, $Res Function(VerifyCodeInfo) _then) =
      _$VerifyCodeInfoCopyWithImpl;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$VerifyCodeInfoCopyWithImpl<$Res>
    implements $VerifyCodeInfoCopyWith<$Res> {
  _$VerifyCodeInfoCopyWithImpl(this._self, this._then);

  final VerifyCodeInfo _self;
  final $Res Function(VerifyCodeInfo) _then;

  /// Create a copy of VerifyCodeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _VerifyCodeInfo extends VerifyCodeInfo {
  const _VerifyCodeInfo({required this.email, required this.code}) : super._();

  @override
  final String email;
  @override
  final String code;

  /// Create a copy of VerifyCodeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyCodeInfoCopyWith<_VerifyCodeInfo> get copyWith =>
      __$VerifyCodeInfoCopyWithImpl<_VerifyCodeInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyCodeInfo &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() {
    return 'VerifyCodeInfo(email: $email, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$VerifyCodeInfoCopyWith<$Res>
    implements $VerifyCodeInfoCopyWith<$Res> {
  factory _$VerifyCodeInfoCopyWith(
          _VerifyCodeInfo value, $Res Function(_VerifyCodeInfo) _then) =
      __$VerifyCodeInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$VerifyCodeInfoCopyWithImpl<$Res>
    implements _$VerifyCodeInfoCopyWith<$Res> {
  __$VerifyCodeInfoCopyWithImpl(this._self, this._then);

  final _VerifyCodeInfo _self;
  final $Res Function(_VerifyCodeInfo) _then;

  /// Create a copy of VerifyCodeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_VerifyCodeInfo(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
