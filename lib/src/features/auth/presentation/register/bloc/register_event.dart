import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';

part 'register_event.freezed.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.updateTermsAgreement({
    required UserAgreement userAgreement,
  }) = UpdateTermsAgreement;
  const factory RegisterEvent.updateEmail({
    required String email,
  }) = UpdateEmail;
  const factory RegisterEvent.updatePassword({
    required String password,
  }) = UpdatePassword;
  const factory RegisterEvent.registerSubmitted() = RegisterSubmitted;
}
