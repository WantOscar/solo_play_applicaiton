import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_verification_email_info.freezed.dart';

@freezed
abstract class SendVerificationEmailInfo with _$SendVerificationEmailInfo {
  const factory SendVerificationEmailInfo({
    required String email,
  }) = _SendVerificationEmailInfo;
}
