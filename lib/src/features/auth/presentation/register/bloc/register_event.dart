import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent() = _RegisterEvent;
}
