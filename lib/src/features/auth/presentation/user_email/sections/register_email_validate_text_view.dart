import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc.dart';

class RegisterEmailValidateTextView extends StatelessWidget {
  const RegisterEmailValidateTextView({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        context.select((UserEmailBloc bloc) => bloc.state.errorMessage);
    return Text(
      errorMessage,
      style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffff0000)),
    );
  }
}
