// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterRequest {
  UserAgreementDto get userAgreement;
  String get email;
  String get password;
  String get proofToken;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      _$RegisterRequestCopyWithImpl<RegisterRequest>(
          this as RegisterRequest, _$identity);

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterRequest &&
            (identical(other.userAgreement, userAgreement) ||
                other.userAgreement == userAgreement) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.proofToken, proofToken) ||
                other.proofToken == proofToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userAgreement, email, password, proofToken);

  @override
  String toString() {
    return 'RegisterRequest(userAgreement: $userAgreement, email: $email, password: $password, proofToken: $proofToken)';
  }
}

/// @nodoc
abstract mixin class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
          RegisterRequest value, $Res Function(RegisterRequest) _then) =
      _$RegisterRequestCopyWithImpl;
  @useResult
  $Res call(
      {UserAgreementDto userAgreement,
      String email,
      String password,
      String proofToken});

  $UserAgreementDtoCopyWith<$Res> get userAgreement;
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._self, this._then);

  final RegisterRequest _self;
  final $Res Function(RegisterRequest) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAgreement = null,
    Object? email = null,
    Object? password = null,
    Object? proofToken = null,
  }) {
    return _then(_self.copyWith(
      userAgreement: null == userAgreement
          ? _self.userAgreement
          : userAgreement // ignore: cast_nullable_to_non_nullable
              as UserAgreementDto,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      proofToken: null == proofToken
          ? _self.proofToken
          : proofToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAgreementDtoCopyWith<$Res> get userAgreement {
    return $UserAgreementDtoCopyWith<$Res>(_self.userAgreement, (value) {
      return _then(_self.copyWith(userAgreement: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RegisterRequest implements RegisterRequest {
  const _RegisterRequest(
      {required this.userAgreement,
      required this.email,
      required this.password,
      required this.proofToken});
  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  @override
  final UserAgreementDto userAgreement;
  @override
  final String email;
  @override
  final String password;
  @override
  final String proofToken;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterRequestCopyWith<_RegisterRequest> get copyWith =>
      __$RegisterRequestCopyWithImpl<_RegisterRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterRequest &&
            (identical(other.userAgreement, userAgreement) ||
                other.userAgreement == userAgreement) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.proofToken, proofToken) ||
                other.proofToken == proofToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userAgreement, email, password, proofToken);

  @override
  String toString() {
    return 'RegisterRequest(userAgreement: $userAgreement, email: $email, password: $password, proofToken: $proofToken)';
  }
}

/// @nodoc
abstract mixin class _$RegisterRequestCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$RegisterRequestCopyWith(
          _RegisterRequest value, $Res Function(_RegisterRequest) _then) =
      __$RegisterRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserAgreementDto userAgreement,
      String email,
      String password,
      String proofToken});

  @override
  $UserAgreementDtoCopyWith<$Res> get userAgreement;
}

/// @nodoc
class __$RegisterRequestCopyWithImpl<$Res>
    implements _$RegisterRequestCopyWith<$Res> {
  __$RegisterRequestCopyWithImpl(this._self, this._then);

  final _RegisterRequest _self;
  final $Res Function(_RegisterRequest) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userAgreement = null,
    Object? email = null,
    Object? password = null,
    Object? proofToken = null,
  }) {
    return _then(_RegisterRequest(
      userAgreement: null == userAgreement
          ? _self.userAgreement
          : userAgreement // ignore: cast_nullable_to_non_nullable
              as UserAgreementDto,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      proofToken: null == proofToken
          ? _self.proofToken
          : proofToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAgreementDtoCopyWith<$Res> get userAgreement {
    return $UserAgreementDtoCopyWith<$Res>(_self.userAgreement, (value) {
      return _then(_self.copyWith(userAgreement: value));
    });
  }
}

/// @nodoc
mixin _$UserAgreementDto {
  bool get isOver14;
  bool get isAgreedToTerms;
  bool get isAgreedToMarketing;
  bool get isConsentedToAds;

  /// Create a copy of UserAgreementDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAgreementDtoCopyWith<UserAgreementDto> get copyWith =>
      _$UserAgreementDtoCopyWithImpl<UserAgreementDto>(
          this as UserAgreementDto, _$identity);

  /// Serializes this UserAgreementDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAgreementDto &&
            (identical(other.isOver14, isOver14) ||
                other.isOver14 == isOver14) &&
            (identical(other.isAgreedToTerms, isAgreedToTerms) ||
                other.isAgreedToTerms == isAgreedToTerms) &&
            (identical(other.isAgreedToMarketing, isAgreedToMarketing) ||
                other.isAgreedToMarketing == isAgreedToMarketing) &&
            (identical(other.isConsentedToAds, isConsentedToAds) ||
                other.isConsentedToAds == isConsentedToAds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isOver14, isAgreedToTerms,
      isAgreedToMarketing, isConsentedToAds);

  @override
  String toString() {
    return 'UserAgreementDto(isOver14: $isOver14, isAgreedToTerms: $isAgreedToTerms, isAgreedToMarketing: $isAgreedToMarketing, isConsentedToAds: $isConsentedToAds)';
  }
}

/// @nodoc
abstract mixin class $UserAgreementDtoCopyWith<$Res> {
  factory $UserAgreementDtoCopyWith(
          UserAgreementDto value, $Res Function(UserAgreementDto) _then) =
      _$UserAgreementDtoCopyWithImpl;
  @useResult
  $Res call(
      {bool isOver14,
      bool isAgreedToTerms,
      bool isAgreedToMarketing,
      bool isConsentedToAds});
}

/// @nodoc
class _$UserAgreementDtoCopyWithImpl<$Res>
    implements $UserAgreementDtoCopyWith<$Res> {
  _$UserAgreementDtoCopyWithImpl(this._self, this._then);

  final UserAgreementDto _self;
  final $Res Function(UserAgreementDto) _then;

  /// Create a copy of UserAgreementDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOver14 = null,
    Object? isAgreedToTerms = null,
    Object? isAgreedToMarketing = null,
    Object? isConsentedToAds = null,
  }) {
    return _then(_self.copyWith(
      isOver14: null == isOver14
          ? _self.isOver14
          : isOver14 // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreedToTerms: null == isAgreedToTerms
          ? _self.isAgreedToTerms
          : isAgreedToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreedToMarketing: null == isAgreedToMarketing
          ? _self.isAgreedToMarketing
          : isAgreedToMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
      isConsentedToAds: null == isConsentedToAds
          ? _self.isConsentedToAds
          : isConsentedToAds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserAgreementDto extends UserAgreementDto {
  const _UserAgreementDto(
      {required this.isOver14,
      required this.isAgreedToTerms,
      required this.isAgreedToMarketing,
      required this.isConsentedToAds})
      : super._();
  factory _UserAgreementDto.fromJson(Map<String, dynamic> json) =>
      _$UserAgreementDtoFromJson(json);

  @override
  final bool isOver14;
  @override
  final bool isAgreedToTerms;
  @override
  final bool isAgreedToMarketing;
  @override
  final bool isConsentedToAds;

  /// Create a copy of UserAgreementDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAgreementDtoCopyWith<_UserAgreementDto> get copyWith =>
      __$UserAgreementDtoCopyWithImpl<_UserAgreementDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAgreementDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAgreementDto &&
            (identical(other.isOver14, isOver14) ||
                other.isOver14 == isOver14) &&
            (identical(other.isAgreedToTerms, isAgreedToTerms) ||
                other.isAgreedToTerms == isAgreedToTerms) &&
            (identical(other.isAgreedToMarketing, isAgreedToMarketing) ||
                other.isAgreedToMarketing == isAgreedToMarketing) &&
            (identical(other.isConsentedToAds, isConsentedToAds) ||
                other.isConsentedToAds == isConsentedToAds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isOver14, isAgreedToTerms,
      isAgreedToMarketing, isConsentedToAds);

  @override
  String toString() {
    return 'UserAgreementDto(isOver14: $isOver14, isAgreedToTerms: $isAgreedToTerms, isAgreedToMarketing: $isAgreedToMarketing, isConsentedToAds: $isConsentedToAds)';
  }
}

/// @nodoc
abstract mixin class _$UserAgreementDtoCopyWith<$Res>
    implements $UserAgreementDtoCopyWith<$Res> {
  factory _$UserAgreementDtoCopyWith(
          _UserAgreementDto value, $Res Function(_UserAgreementDto) _then) =
      __$UserAgreementDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isOver14,
      bool isAgreedToTerms,
      bool isAgreedToMarketing,
      bool isConsentedToAds});
}

/// @nodoc
class __$UserAgreementDtoCopyWithImpl<$Res>
    implements _$UserAgreementDtoCopyWith<$Res> {
  __$UserAgreementDtoCopyWithImpl(this._self, this._then);

  final _UserAgreementDto _self;
  final $Res Function(_UserAgreementDto) _then;

  /// Create a copy of UserAgreementDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isOver14 = null,
    Object? isAgreedToTerms = null,
    Object? isAgreedToMarketing = null,
    Object? isConsentedToAds = null,
  }) {
    return _then(_UserAgreementDto(
      isOver14: null == isOver14
          ? _self.isOver14
          : isOver14 // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreedToTerms: null == isAgreedToTerms
          ? _self.isAgreedToTerms
          : isAgreedToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreedToMarketing: null == isAgreedToMarketing
          ? _self.isAgreedToMarketing
          : isAgreedToMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
      isConsentedToAds: null == isConsentedToAds
          ? _self.isConsentedToAds
          : isConsentedToAds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
