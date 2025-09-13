// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterPasswordState {
  String get password;
  bool get obscurePassword;
  String get passwordCheck;
  bool get obscurePasswordCheck;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterPasswordStateCopyWith<RegisterPasswordState> get copyWith =>
      _$RegisterPasswordStateCopyWithImpl<RegisterPasswordState>(
          this as RegisterPasswordState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterPasswordState &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.passwordCheck, passwordCheck) ||
                other.passwordCheck == passwordCheck) &&
            (identical(other.obscurePasswordCheck, obscurePasswordCheck) ||
                other.obscurePasswordCheck == obscurePasswordCheck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, obscurePassword,
      passwordCheck, obscurePasswordCheck);

  @override
  String toString() {
    return 'RegisterPasswordState(password: $password, obscurePassword: $obscurePassword, passwordCheck: $passwordCheck, obscurePasswordCheck: $obscurePasswordCheck)';
  }
}

/// @nodoc
abstract mixin class $RegisterPasswordStateCopyWith<$Res> {
  factory $RegisterPasswordStateCopyWith(RegisterPasswordState value,
          $Res Function(RegisterPasswordState) _then) =
      _$RegisterPasswordStateCopyWithImpl;
  @useResult
  $Res call(
      {String password,
      bool obscurePassword,
      String passwordCheck,
      bool obscurePasswordCheck});
}

/// @nodoc
class _$RegisterPasswordStateCopyWithImpl<$Res>
    implements $RegisterPasswordStateCopyWith<$Res> {
  _$RegisterPasswordStateCopyWithImpl(this._self, this._then);

  final RegisterPasswordState _self;
  final $Res Function(RegisterPasswordState) _then;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? obscurePassword = null,
    Object? passwordCheck = null,
    Object? obscurePasswordCheck = null,
  }) {
    return _then(_self.copyWith(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      obscurePassword: null == obscurePassword
          ? _self.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordCheck: null == passwordCheck
          ? _self.passwordCheck
          : passwordCheck // ignore: cast_nullable_to_non_nullable
              as String,
      obscurePasswordCheck: null == obscurePasswordCheck
          ? _self.obscurePasswordCheck
          : obscurePasswordCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _RegisterPasswordState extends RegisterPasswordState {
  const _RegisterPasswordState(
      {this.password = "",
      this.obscurePassword = true,
      this.passwordCheck = "",
      this.obscurePasswordCheck = true})
      : super._();

  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool obscurePassword;
  @override
  @JsonKey()
  final String passwordCheck;
  @override
  @JsonKey()
  final bool obscurePasswordCheck;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterPasswordStateCopyWith<_RegisterPasswordState> get copyWith =>
      __$RegisterPasswordStateCopyWithImpl<_RegisterPasswordState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterPasswordState &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.passwordCheck, passwordCheck) ||
                other.passwordCheck == passwordCheck) &&
            (identical(other.obscurePasswordCheck, obscurePasswordCheck) ||
                other.obscurePasswordCheck == obscurePasswordCheck));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, obscurePassword,
      passwordCheck, obscurePasswordCheck);

  @override
  String toString() {
    return 'RegisterPasswordState(password: $password, obscurePassword: $obscurePassword, passwordCheck: $passwordCheck, obscurePasswordCheck: $obscurePasswordCheck)';
  }
}

/// @nodoc
abstract mixin class _$RegisterPasswordStateCopyWith<$Res>
    implements $RegisterPasswordStateCopyWith<$Res> {
  factory _$RegisterPasswordStateCopyWith(_RegisterPasswordState value,
          $Res Function(_RegisterPasswordState) _then) =
      __$RegisterPasswordStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String password,
      bool obscurePassword,
      String passwordCheck,
      bool obscurePasswordCheck});
}

/// @nodoc
class __$RegisterPasswordStateCopyWithImpl<$Res>
    implements _$RegisterPasswordStateCopyWith<$Res> {
  __$RegisterPasswordStateCopyWithImpl(this._self, this._then);

  final _RegisterPasswordState _self;
  final $Res Function(_RegisterPasswordState) _then;

  /// Create a copy of RegisterPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
    Object? obscurePassword = null,
    Object? passwordCheck = null,
    Object? obscurePasswordCheck = null,
  }) {
    return _then(_RegisterPasswordState(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      obscurePassword: null == obscurePassword
          ? _self.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordCheck: null == passwordCheck
          ? _self.passwordCheck
          : passwordCheck // ignore: cast_nullable_to_non_nullable
              as String,
      obscurePasswordCheck: null == obscurePasswordCheck
          ? _self.obscurePasswordCheck
          : obscurePasswordCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
