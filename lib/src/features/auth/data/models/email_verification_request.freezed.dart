// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailVerificationRequest {
  String get email;

  /// Create a copy of EmailVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmailVerificationRequestCopyWith<EmailVerificationRequest> get copyWith =>
      _$EmailVerificationRequestCopyWithImpl<EmailVerificationRequest>(
          this as EmailVerificationRequest, _$identity);

  /// Serializes this EmailVerificationRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailVerificationRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'EmailVerificationRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class $EmailVerificationRequestCopyWith<$Res> {
  factory $EmailVerificationRequestCopyWith(EmailVerificationRequest value,
          $Res Function(EmailVerificationRequest) _then) =
      _$EmailVerificationRequestCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailVerificationRequestCopyWithImpl<$Res>
    implements $EmailVerificationRequestCopyWith<$Res> {
  _$EmailVerificationRequestCopyWithImpl(this._self, this._then);

  final EmailVerificationRequest _self;
  final $Res Function(EmailVerificationRequest) _then;

  /// Create a copy of EmailVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EmailVerificationRequest implements EmailVerificationRequest {
  const _EmailVerificationRequest({required this.email});
  factory _EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);

  @override
  final String email;

  /// Create a copy of EmailVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmailVerificationRequestCopyWith<_EmailVerificationRequest> get copyWith =>
      __$EmailVerificationRequestCopyWithImpl<_EmailVerificationRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmailVerificationRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailVerificationRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'EmailVerificationRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$EmailVerificationRequestCopyWith<$Res>
    implements $EmailVerificationRequestCopyWith<$Res> {
  factory _$EmailVerificationRequestCopyWith(_EmailVerificationRequest value,
          $Res Function(_EmailVerificationRequest) _then) =
      __$EmailVerificationRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$EmailVerificationRequestCopyWithImpl<$Res>
    implements _$EmailVerificationRequestCopyWith<$Res> {
  __$EmailVerificationRequestCopyWithImpl(this._self, this._then);

  final _EmailVerificationRequest _self;
  final $Res Function(_EmailVerificationRequest) _then;

  /// Create a copy of EmailVerificationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_EmailVerificationRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
