import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unknown({
    @Default(AuthenticateStatus.unknown) AuthenticateStatus status,
  }) = Unknown;
  const factory AuthState.authenticated({
    @Default(AuthenticateStatus.authenticated) AuthenticateStatus status,
  }) = Authenticated;
  const factory AuthState.unauthenticated({
    @Default(AuthenticateStatus.unauthenticated) AuthenticateStatus status,
  }) = Unauthenticated;
}
