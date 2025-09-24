import 'package:equatable/equatable.dart';
import 'package:solo_play_application/src/features/auth/data/models/user_agreement.dart';

class RegisterInfo extends Equatable {
  final String email;
  final String password;
  final UserAgreement userAgreement;

  const RegisterInfo({
    required this.email,
    required this.password,
    required this.userAgreement,
  });

  @override
  List<Object?> get props => [email, password, userAgreement];
}
