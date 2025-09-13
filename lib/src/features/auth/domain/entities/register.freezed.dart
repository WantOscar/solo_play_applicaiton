// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Register {
  String get email;
  String get password;
  UserAgreement get userAgreement;

  /// Create a copy of Register
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this as Register, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Register &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userAgreement, userAgreement) ||
                other.userAgreement == userAgreement));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, userAgreement);

  @override
  String toString() {
    return 'Register(email: $email, password: $password, userAgreement: $userAgreement)';
  }
}

/// @nodoc
abstract mixin class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) _then) =
      _$RegisterCopyWithImpl;
  @useResult
  $Res call({String email, String password, UserAgreement userAgreement});

  $UserAgreementCopyWith<$Res> get userAgreement;
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res> implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._self, this._then);

  final Register _self;
  final $Res Function(Register) _then;

  /// Create a copy of Register
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? userAgreement = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userAgreement: null == userAgreement
          ? _self.userAgreement
          : userAgreement // ignore: cast_nullable_to_non_nullable
              as UserAgreement,
    ));
  }

  /// Create a copy of Register
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAgreementCopyWith<$Res> get userAgreement {
    return $UserAgreementCopyWith<$Res>(_self.userAgreement, (value) {
      return _then(_self.copyWith(userAgreement: value));
    });
  }
}

/// @nodoc

class _Register implements Register {
  const _Register(
      {this.email = "",
      this.password = "",
      this.userAgreement = const UserAgreement()});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final UserAgreement userAgreement;

  /// Create a copy of Register
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterCopyWith<_Register> get copyWith =>
      __$RegisterCopyWithImpl<_Register>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Register &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userAgreement, userAgreement) ||
                other.userAgreement == userAgreement));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, userAgreement);

  @override
  String toString() {
    return 'Register(email: $email, password: $password, userAgreement: $userAgreement)';
  }
}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res>
    implements $RegisterCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) =
      __$RegisterCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password, UserAgreement userAgreement});

  @override
  $UserAgreementCopyWith<$Res> get userAgreement;
}

/// @nodoc
class __$RegisterCopyWithImpl<$Res> implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

  /// Create a copy of Register
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? userAgreement = null,
  }) {
    return _then(_Register(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userAgreement: null == userAgreement
          ? _self.userAgreement
          : userAgreement // ignore: cast_nullable_to_non_nullable
              as UserAgreement,
    ));
  }

  /// Create a copy of Register
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAgreementCopyWith<$Res> get userAgreement {
    return $UserAgreementCopyWith<$Res>(_self.userAgreement, (value) {
      return _then(_self.copyWith(userAgreement: value));
    });
  }
}

// dart format on
