import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';
import 'package:solo_play_application/src/features/auth/data/models/user_agreement.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  @JsonSerializable(explicitToJson: true)
  const factory RegisterRequest({
    required UserAgreement userAgreement,
    required String email,
    required String password,
    required String code,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(JsonMap json) =>
      _$RegisterRequestFromJson(json);
}
