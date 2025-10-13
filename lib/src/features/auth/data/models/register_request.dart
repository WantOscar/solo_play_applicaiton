import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  @JsonSerializable(explicitToJson: true)
  const factory RegisterRequest({
    required UserAgreementDto agreement,
    required String email,
    required String password,
    required String proofToken,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(JsonMap json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
abstract class UserAgreementDto with _$UserAgreementDto {
  const factory UserAgreementDto({
    required bool isOver14,
    required bool isAgreedToTerms,
    required bool isAgreedToMarketing,
    required bool isConsentedToAds,
  }) = _UserAgreementDto;

  factory UserAgreementDto.fromJson(JsonMap json) =>
      _$UserAgreementDtoFromJson(json);

  const UserAgreementDto._();

  factory UserAgreementDto.fromEntity(UserAgreement userAgreement) {
    return UserAgreementDto(
        isOver14: userAgreement.isOver14,
        isAgreedToTerms: userAgreement.isAgreedToTerms,
        isAgreedToMarketing: userAgreement.isAgreedToMarketing,
        isConsentedToAds: userAgreement.isConsentedToAds);
  }
}
