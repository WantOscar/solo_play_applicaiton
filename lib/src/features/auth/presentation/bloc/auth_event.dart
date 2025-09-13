import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.subscriptionRequested() = AuthSubscriptionRequested;

  const factory AuthEvent.onLogoutTapped() = LogoutTapped;
}
