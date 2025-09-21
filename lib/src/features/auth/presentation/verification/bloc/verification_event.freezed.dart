// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VerificationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VerificationEvent()';
  }
}

/// @nodoc
class $VerificationEventCopyWith<$Res> {
  $VerificationEventCopyWith(
      VerificationEvent _, $Res Function(VerificationEvent) __);
}

/// @nodoc

class VerificationCodeChanged implements VerificationEvent {
  const VerificationCodeChanged(this.code);

  final String code;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerificationCodeChangedCopyWith<VerificationCodeChanged> get copyWith =>
      _$VerificationCodeChangedCopyWithImpl<VerificationCodeChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationCodeChanged &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @override
  String toString() {
    return 'VerificationEvent.codeChanged(code: $code)';
  }
}

/// @nodoc
abstract mixin class $VerificationCodeChangedCopyWith<$Res>
    implements $VerificationEventCopyWith<$Res> {
  factory $VerificationCodeChangedCopyWith(VerificationCodeChanged value,
          $Res Function(VerificationCodeChanged) _then) =
      _$VerificationCodeChangedCopyWithImpl;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$VerificationCodeChangedCopyWithImpl<$Res>
    implements $VerificationCodeChangedCopyWith<$Res> {
  _$VerificationCodeChangedCopyWithImpl(this._self, this._then);

  final VerificationCodeChanged _self;
  final $Res Function(VerificationCodeChanged) _then;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
  }) {
    return _then(VerificationCodeChanged(
      null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class VerificationEmailSent implements VerificationEvent {
  const VerificationEmailSent(this.email);

  final String email;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerificationEmailSentCopyWith<VerificationEmailSent> get copyWith =>
      _$VerificationEmailSentCopyWithImpl<VerificationEmailSent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerificationEmailSent &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'VerificationEvent.verificationEmailSent(email: $email)';
  }
}

/// @nodoc
abstract mixin class $VerificationEmailSentCopyWith<$Res>
    implements $VerificationEventCopyWith<$Res> {
  factory $VerificationEmailSentCopyWith(VerificationEmailSent value,
          $Res Function(VerificationEmailSent) _then) =
      _$VerificationEmailSentCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$VerificationEmailSentCopyWithImpl<$Res>
    implements $VerificationEmailSentCopyWith<$Res> {
  _$VerificationEmailSentCopyWithImpl(this._self, this._then);

  final VerificationEmailSent _self;
  final $Res Function(VerificationEmailSent) _then;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(VerificationEmailSent(
      null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
