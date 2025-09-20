// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_agreement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAgreement _$UserAgreementFromJson(Map<String, dynamic> json) =>
    _UserAgreement(
      isOver14: json['isOver14'] as bool,
      isAgreedToTerms: json['isAgreedToTerms'] as bool,
      isAgreedToMarketing: json['isAgreedToMarketing'] as bool,
      isConsentedToAds: json['isConsentedToAds'] as bool,
    );

Map<String, dynamic> _$UserAgreementToJson(_UserAgreement instance) =>
    <String, dynamic>{
      'isOver14': instance.isOver14,
      'isAgreedToTerms': instance.isAgreedToTerms,
      'isAgreedToMarketing': instance.isAgreedToMarketing,
      'isConsentedToAds': instance.isConsentedToAds,
    };
