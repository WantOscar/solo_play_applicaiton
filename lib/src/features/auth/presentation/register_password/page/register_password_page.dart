import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/register_password_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/views/register_password_ui.dart';

class RegisterPasswordPage extends StatelessWidget {
  const RegisterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterPasswordBloc>(
      create: (context) => RegisterPasswordBloc(),
      child: RegisterPasswordUI(),
    );
  }
}
