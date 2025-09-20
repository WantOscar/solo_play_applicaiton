import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';

part 'user_agreement.freezed.dart';
part 'user_agreement.g.dart';

@freezed
abstract class UserAgreement with _$UserAgreement {
  const factory UserAgreement({
    required bool isOver14,
    required bool isAgreedToTerms,
    required bool isAgreedToMarketing,
    required bool isConsentedToAds,
  }) = _UserAgreement;

  factory UserAgreement.fromJson(JsonMap json) => _$UserAgreementFromJson(json);
}
