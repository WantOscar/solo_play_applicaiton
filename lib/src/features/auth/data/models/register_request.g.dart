// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      userAgreement:
          UserAgreement.fromJson(json['userAgreement'] as Map<String, dynamic>),
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
