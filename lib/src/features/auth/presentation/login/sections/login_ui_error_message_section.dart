import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/widgets/error_text.dart';

import '../bloc/bloc.dart';

class LoginUiErrorMessageSection extends StatelessWidget {
  const LoginUiErrorMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, String>(
      selector: (state) {
        return state.errorMessage;
      },
      builder: (context, errorMessage) {
        return ErrorText(
          errorMessage: errorMessage,
        );
      },
    );
  }
}
