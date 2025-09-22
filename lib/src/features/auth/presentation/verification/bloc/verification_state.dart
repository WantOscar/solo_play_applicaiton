import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_state.freezed.dart';

enum VerificationStatus { initial, sending, sent, error, verifying, verified }

@freezed
abstract class VerificationState with _$VerificationState {
  const factory VerificationState({
    @Default('') String code,
    @Default(VerificationStatus.initial) VerificationStatus status,
    String? errorMessage,
  }) = _VerificationState;
}
