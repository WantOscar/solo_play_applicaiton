// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterState {
  RegisterStep get step;
  Register get register;
  RegisterStatus get status;
  String? get errorMessage;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      _$RegisterStateCopyWithImpl<RegisterState>(
          this as RegisterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterState &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, step, register, status, errorMessage);

  @override
  String toString() {
    return 'RegisterState(step: $step, register: $register, status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) _then) =
      _$RegisterStateCopyWithImpl;
  @useResult
  $Res call(
      {RegisterStep step,
      Register register,
      RegisterStatus status,
      String? errorMessage});

  $RegisterCopyWith<$Res> get register;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? register = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      step: null == step
          ? _self.step
          : step // ignore: cast_nullable_to_non_nullable
              as RegisterStep,
      register: null == register
          ? _self.register
          : register // ignore: cast_nullable_to_non_nullable
              as Register,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<$Res> get register {
    return $RegisterCopyWith<$Res>(_self.register, (value) {
      return _then(_self.copyWith(register: value));
    });
  }
}

/// @nodoc

class _RegisterState implements RegisterState {
  const _RegisterState(
      {this.step = RegisterStep.terms,
      this.register = const Register(),
      this.status = RegisterStatus.initial,
      this.errorMessage});

  @override
  @JsonKey()
  final RegisterStep step;
  @override
  @JsonKey()
  final Register register;
  @override
  @JsonKey()
  final RegisterStatus status;
  @override
  final String? errorMessage;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterState &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, step, register, status, errorMessage);

  @override
  String toString() {
    return 'RegisterState(step: $step, register: $register, status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) _then) =
      __$RegisterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RegisterStep step,
      Register register,
      RegisterStatus status,
      String? errorMessage});

  @override
  $RegisterCopyWith<$Res> get register;
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? step = null,
    Object? register = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_RegisterState(
      step: null == step
          ? _self.step
          : step // ignore: cast_nullable_to_non_nullable
              as RegisterStep,
      register: null == register
          ? _self.register
          : register // ignore: cast_nullable_to_non_nullable
              as Register,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<$Res> get register {
    return $RegisterCopyWith<$Res>(_self.register, (value) {
      return _then(_self.copyWith(register: value));
    });
  }
}

// dart format on
