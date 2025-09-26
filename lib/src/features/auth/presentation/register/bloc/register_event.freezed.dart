// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterEvent()';
  }
}

/// @nodoc
class $RegisterEventCopyWith<$Res> {
  $RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}

/// @nodoc

class UpdateTermsAgreement implements RegisterEvent {
  const UpdateTermsAgreement({required this.userAgreement});

  final UserAgreement userAgreement;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTermsAgreementCopyWith<UpdateTermsAgreement> get copyWith =>
      _$UpdateTermsAgreementCopyWithImpl<UpdateTermsAgreement>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTermsAgreement &&
            (identical(other.userAgreement, userAgreement) ||
                other.userAgreement == userAgreement));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userAgreement);

  @override
  String toString() {
    return 'RegisterEvent.updateTermsAgreement(userAgreement: $userAgreement)';
  }
}

/// @nodoc
abstract mixin class $UpdateTermsAgreementCopyWith<$Res>
    implements $RegisterEventCopyWith<$Res> {
  factory $UpdateTermsAgreementCopyWith(UpdateTermsAgreement value,
          $Res Function(UpdateTermsAgreement) _then) =
      _$UpdateTermsAgreementCopyWithImpl;
  @useResult
  $Res call({UserAgreement userAgreement});

  $UserAgreementCopyWith<$Res> get userAgreement;
}

/// @nodoc
class _$UpdateTermsAgreementCopyWithImpl<$Res>
    implements $UpdateTermsAgreementCopyWith<$Res> {
  _$UpdateTermsAgreementCopyWithImpl(this._self, this._then);

  final UpdateTermsAgreement _self;
  final $Res Function(UpdateTermsAgreement) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userAgreement = null,
  }) {
    return _then(UpdateTermsAgreement(
      userAgreement: null == userAgreement
          ? _self.userAgreement
          : userAgreement // ignore: cast_nullable_to_non_nullable
              as UserAgreement,
    ));
  }

  /// Create a copy of RegisterEvent
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

class UpdateEmail implements RegisterEvent {
  const UpdateEmail({required this.email});

  final String email;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateEmailCopyWith<UpdateEmail> get copyWith =>
      _$UpdateEmailCopyWithImpl<UpdateEmail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateEmail &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'RegisterEvent.updateEmail(email: $email)';
  }
}

/// @nodoc
abstract mixin class $UpdateEmailCopyWith<$Res>
    implements $RegisterEventCopyWith<$Res> {
  factory $UpdateEmailCopyWith(
          UpdateEmail value, $Res Function(UpdateEmail) _then) =
      _$UpdateEmailCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$UpdateEmailCopyWithImpl<$Res> implements $UpdateEmailCopyWith<$Res> {
  _$UpdateEmailCopyWithImpl(this._self, this._then);

  final UpdateEmail _self;
  final $Res Function(UpdateEmail) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(UpdateEmail(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdatePassword implements RegisterEvent {
  const UpdatePassword({required this.password});

  final String password;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordCopyWith<UpdatePassword> get copyWith =>
      _$UpdatePasswordCopyWithImpl<UpdatePassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePassword &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @override
  String toString() {
    return 'RegisterEvent.updatePassword(password: $password)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordCopyWith<$Res>
    implements $RegisterEventCopyWith<$Res> {
  factory $UpdatePasswordCopyWith(
          UpdatePassword value, $Res Function(UpdatePassword) _then) =
      _$UpdatePasswordCopyWithImpl;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$UpdatePasswordCopyWithImpl<$Res>
    implements $UpdatePasswordCopyWith<$Res> {
  _$UpdatePasswordCopyWithImpl(this._self, this._then);

  final UpdatePassword _self;
  final $Res Function(UpdatePassword) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
  }) {
    return _then(UpdatePassword(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class RegisterSubmitted implements RegisterEvent {
  const RegisterSubmitted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterEvent.registerSubmitted()';
  }
}

// dart format on
