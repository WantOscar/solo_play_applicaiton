// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_agreement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAgreement {
  bool get isOver14;
  bool get isAgreedToTerms;
  bool get isAgreedToMarketing;
  bool get isConsentedToAds;

  /// Create a copy of UserAgreement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAgreementCopyWith<UserAgreement> get copyWith =>
      _$UserAgreementCopyWithImpl<UserAgreement>(
          this as UserAgreement, _$identity);

  /// Serializes this UserAgreement to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAgreement &&
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
    return 'UserAgreement(isOver14: $isOver14, isAgreedToTerms: $isAgreedToTerms, isAgreedToMarketing: $isAgreedToMarketing, isConsentedToAds: $isConsentedToAds)';
  }
}

/// @nodoc
abstract mixin class $UserAgreementCopyWith<$Res> {
  factory $UserAgreementCopyWith(
          UserAgreement value, $Res Function(UserAgreement) _then) =
      _$UserAgreementCopyWithImpl;
  @useResult
  $Res call(
      {bool isOver14,
      bool isAgreedToTerms,
      bool isAgreedToMarketing,
      bool isConsentedToAds});
}

/// @nodoc
class _$UserAgreementCopyWithImpl<$Res>
    implements $UserAgreementCopyWith<$Res> {
  _$UserAgreementCopyWithImpl(this._self, this._then);

  final UserAgreement _self;
  final $Res Function(UserAgreement) _then;

  /// Create a copy of UserAgreement
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
class _UserAgreement implements UserAgreement {
  const _UserAgreement(
      {required this.isOver14,
      required this.isAgreedToTerms,
      required this.isAgreedToMarketing,
      required this.isConsentedToAds});
  factory _UserAgreement.fromJson(Map<String, dynamic> json) =>
      _$UserAgreementFromJson(json);

  @override
  final bool isOver14;
  @override
  final bool isAgreedToTerms;
  @override
  final bool isAgreedToMarketing;
  @override
  final bool isConsentedToAds;

  /// Create a copy of UserAgreement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAgreementCopyWith<_UserAgreement> get copyWith =>
      __$UserAgreementCopyWithImpl<_UserAgreement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAgreementToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAgreement &&
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
    return 'UserAgreement(isOver14: $isOver14, isAgreedToTerms: $isAgreedToTerms, isAgreedToMarketing: $isAgreedToMarketing, isConsentedToAds: $isConsentedToAds)';
  }
}

/// @nodoc
abstract mixin class _$UserAgreementCopyWith<$Res>
    implements $UserAgreementCopyWith<$Res> {
  factory _$UserAgreementCopyWith(
          _UserAgreement value, $Res Function(_UserAgreement) _then) =
      __$UserAgreementCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isOver14,
      bool isAgreedToTerms,
      bool isAgreedToMarketing,
      bool isConsentedToAds});
}

/// @nodoc
class __$UserAgreementCopyWithImpl<$Res>
    implements _$UserAgreementCopyWith<$Res> {
  __$UserAgreementCopyWithImpl(this._self, this._then);

  final _UserAgreement _self;
  final $Res Function(_UserAgreement) _then;

  /// Create a copy of UserAgreement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isOver14 = null,
    Object? isAgreedToTerms = null,
    Object? isAgreedToMarketing = null,
    Object? isConsentedToAds = null,
  }) {
    return _then(_UserAgreement(
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
