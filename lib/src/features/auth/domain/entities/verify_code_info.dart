import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_info.freezed.dart';

@freezed
abstract class VerifyCodeInfo with _$VerifyCodeInfo {
  const factory VerifyCodeInfo({
    required String email,
    required String code,
  }) = _VerifyCodeInfo;

  const VerifyCodeInfo._();
}
