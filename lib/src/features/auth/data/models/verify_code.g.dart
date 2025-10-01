// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyCodeRequest _$VerifyCodeRequestFromJson(Map<String, dynamic> json) =>
    _VerifyCodeRequest(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyCodeRequestToJson(_VerifyCodeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };

_VerifyCodeResponse _$VerifyCodeResponseFromJson(Map<String, dynamic> json) =>
    _VerifyCodeResponse(
      proofToken: json['proofToken'] as String,
    );

Map<String, dynamic> _$VerifyCodeResponseToJson(_VerifyCodeResponse instance) =>
    <String, dynamic>{
      'proofToken': instance.proofToken,
    };
