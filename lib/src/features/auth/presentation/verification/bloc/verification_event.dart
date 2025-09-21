import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_event.freezed.dart';

@freezed
sealed class VerificationEvent with _$VerificationEvent {
  const factory VerificationEvent.codeChanged(String code) =
      VerificationCodeChanged;
  const factory VerificationEvent.verificationEmailSent(String email) =
      VerificationEmailSent;
}
