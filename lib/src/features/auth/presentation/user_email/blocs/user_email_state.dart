import 'package:equatable/equatable.dart';

enum UserEmailStatus { empty, valid, invalid, avail, conflict }

class UserEmailState extends Equatable {
  final String email;
  final String errorMessage;

  final UserEmailStatus status;

  const UserEmailState(
      {this.email = "",
      this.errorMessage = "",
      this.status = UserEmailStatus.empty});

  UserEmailState copyWith({
    String? email,
    String? errorMessage,
    UserEmailStatus? status,
  }) {
    return UserEmailState(
        email: email ?? this.email,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [email, errorMessage, status];
}
