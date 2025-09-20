import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/widgets/validation_icon.dart';

class RegisterEmailValidateIconView extends StatelessWidget {
  const RegisterEmailValidateIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserEmailBloc, UserEmailState, UserEmailStatus>(
      selector: (state) {
        return state.status;
      },
      builder: (context, status) {
        // 이메일이 비어있으면 아무것도 안 보여줌
        if (status == UserEmailStatus.empty) {
          return const SizedBox.shrink();
        }

        // 이메일이 입력되어 있으면 ValidationIcon 보여줌
        return ValidationIcon(
          isValid:
              status == UserEmailStatus.valid || status == UserEmailStatus.avail
                  ? true
                  : false,
        );
      },
    );
  }
}
