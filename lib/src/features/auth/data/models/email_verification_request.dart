import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_request.freezed.dart';
part 'email_verification_request.g.dart';

@freezed
abstract class EmailVerificationRequest with _$EmailVerificationRequest {
  const factory EmailVerificationRequest({
    required String email,
  }) = _EmailVerificationRequest;

  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);
}
