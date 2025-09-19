import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/next_step_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';

class RegisterEmailButtonView extends StatelessWidget {
  const RegisterEmailButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserEmailBloc, UserEmailState>(
      listener: (context, state) {
        if (state.status == UserEmailStatus.avail) {
          context.read<RegisterBloc>().add(UpdateEmail(email: state.email));
          context.push(RouterPath.registerPassword);
        }
      },
      child: BlocBuilder<UserEmailBloc, UserEmailState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status || prev.email != curr.email,
        builder: (context, state) {
          final isEmailValid = state.status == UserEmailStatus.valid;

          return NextStepButton(
            onTap: isEmailValid
                ? () {
                    context.read<UserEmailBloc>().add(
                          UserEmailCheckDuplicate(email: state.email),
                        );
                  }
                : null,
          );
        },
      ),
    );
  }
}
