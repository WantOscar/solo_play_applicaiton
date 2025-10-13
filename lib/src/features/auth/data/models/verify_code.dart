import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code.freezed.dart';
part 'verify_code.g.dart';

@freezed
abstract class VerifyCodeRequest with _$VerifyCodeRequest {
  const factory VerifyCodeRequest({
    required String email,
    required String code,
  }) = _VerifyCodeRequest;

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);
}

@freezed
abstract class VerifyCodeResponse with _$VerifyCodeResponse {
  const factory VerifyCodeResponse({
    required String proofToken,
  }) = _VerifyCodeResponse;

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}
