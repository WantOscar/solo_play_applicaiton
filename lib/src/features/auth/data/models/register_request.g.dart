// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      userAgreement: UserAgreementDto.fromJson(
          json['userAgreement'] as Map<String, dynamic>),
      email: json['email'] as String,
      password: json['password'] as String,
      proofToken: json['proofToken'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'userAgreement': instance.userAgreement.toJson(),
      'email': instance.email,
      'password': instance.password,
      'proofToken': instance.proofToken,
    };

_UserAgreementDto _$UserAgreementDtoFromJson(Map<String, dynamic> json) =>
    _UserAgreementDto(
      isOver14: json['isOver14'] as bool,
      isAgreedToTerms: json['isAgreedToTerms'] as bool,
      isAgreedToMarketing: json['isAgreedToMarketing'] as bool,
      isConsentedToAds: json['isConsentedToAds'] as bool,
    );

Map<String, dynamic> _$UserAgreementDtoToJson(_UserAgreementDto instance) =>
    <String, dynamic>{
      'isOver14': instance.isOver14,
      'isAgreedToTerms': instance.isAgreedToTerms,
      'isAgreedToMarketing': instance.isAgreedToMarketing,
      'isConsentedToAds': instance.isConsentedToAds,
    };
