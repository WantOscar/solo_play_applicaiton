// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_request.dart';

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
