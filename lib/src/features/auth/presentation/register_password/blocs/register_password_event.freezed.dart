// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterPasswordEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterPasswordEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterPasswordEvent()';
  }
}

/// @nodoc
class $RegisterPasswordEventCopyWith<$Res> {
  $RegisterPasswordEventCopyWith(
      RegisterPasswordEvent _, $Res Function(RegisterPasswordEvent) __);
}

/// @nodoc

class RegisterPasswordChanged implements RegisterPasswordEvent {
  const RegisterPasswordChanged({required this.password});

  final String password;

  /// Create a copy of RegisterPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterPasswordChangedCopyWith<RegisterPasswordChanged> get copyWith =>
      _$RegisterPasswordChangedCopyWithImpl<RegisterPasswordChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterPasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @override
  String toString() {
    return 'RegisterPasswordEvent.changed(password: $password)';
  }
}

/// @nodoc
abstract mixin class $RegisterPasswordChangedCopyWith<$Res>
    implements $RegisterPasswordEventCopyWith<$Res> {
  factory $RegisterPasswordChangedCopyWith(RegisterPasswordChanged value,
          $Res Function(RegisterPasswordChanged) _then) =
      _$RegisterPasswordChangedCopyWithImpl;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$RegisterPasswordChangedCopyWithImpl<$Res>
    implements $RegisterPasswordChangedCopyWith<$Res> {
  _$RegisterPasswordChangedCopyWithImpl(this._self, this._then);

  final RegisterPasswordChanged _self;
  final $Res Function(RegisterPasswordChanged) _then;

  /// Create a copy of RegisterPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
  }) {
    return _then(RegisterPasswordChanged(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class RegisterPasswordCheckChanged implements RegisterPasswordEvent {
  const RegisterPasswordCheckChanged({required this.password});

  final String password;

  /// Create a copy of RegisterPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterPasswordCheckChangedCopyWith<RegisterPasswordCheckChanged>
      get copyWith => _$RegisterPasswordCheckChangedCopyWithImpl<
          RegisterPasswordCheckChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterPasswordCheckChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @override
  String toString() {
    return 'RegisterPasswordEvent.checkChanged(password: $password)';
  }
}

/// @nodoc
abstract mixin class $RegisterPasswordCheckChangedCopyWith<$Res>
    implements $RegisterPasswordEventCopyWith<$Res> {
  factory $RegisterPasswordCheckChangedCopyWith(
          RegisterPasswordCheckChanged value,
          $Res Function(RegisterPasswordCheckChanged) _then) =
      _$RegisterPasswordCheckChangedCopyWithImpl;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$RegisterPasswordCheckChangedCopyWithImpl<$Res>
    implements $RegisterPasswordCheckChangedCopyWith<$Res> {
  _$RegisterPasswordCheckChangedCopyWithImpl(this._self, this._then);

  final RegisterPasswordCheckChanged _self;
  final $Res Function(RegisterPasswordCheckChanged) _then;

  /// Create a copy of RegisterPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
  }) {
    return _then(RegisterPasswordCheckChanged(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ObscurePasswordToggled implements RegisterPasswordEvent {
  const ObscurePasswordToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ObscurePasswordToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterPasswordEvent.obscurePasswordToggled()';
  }
}

/// @nodoc

class ObscurePasswordCheckToggled implements RegisterPasswordEvent {
  const ObscurePasswordCheckToggled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ObscurePasswordCheckToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterPasswordEvent.obscurePasswordCheckToggled()';
  }
}

// dart format on
