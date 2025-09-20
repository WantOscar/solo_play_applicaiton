import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';

part 'register.freezed.dart';

@freezed
abstract class Register with _$Register {
  const factory Register({
    @Default(false) bool termsAgreed,
    @Default("") String email,
    @Default("") String password,
    @Default(UserAgreement()) UserAgreement userAgreement,
  }) = _Register;
}
