import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/register_email_validate_icon_view.dart';

class RegisterEmailInputTextField extends StatelessWidget {
  const RegisterEmailInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "이메일(아이디)",
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 6,
        ),
        BlocSelector<UserEmailBloc, UserEmailState, bool>(
          selector: (state) {
            return state.errorMessage.isNotEmpty;
          },
          builder: (context, isError) {
            return PrimaryTextField(
              isError: isError,
              hintText: "abc@email.com",
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffc3c3c3)),
              onChanged: (email) => context
                  .read<UserEmailBloc>()
                  .add(UserEmailChanged(email: email)),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: RegisterEmailValidateIconView(),
              ),
            );
          },
        ),
      ],
    );
  }
}
