import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/widgets/image_icon.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/widgets/password_check_validate_text.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/widgets/password_validate_text.dart';

class RegisterPasswordInputTextField extends StatelessWidget {
  const RegisterPasswordInputTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registerPasswordBloc = context.read<RegisterPasswordBloc>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocSelector<RegisterPasswordBloc, RegisterPasswordState, bool>(
          selector: (state) {
            return state.obscurePassword;
          },
          builder: (context, obscurePassword) {
            return PrimaryTextField(
              hintText: '비밀번호를 입력해주세요',
              obscureText: obscurePassword,
              onChanged: (password) {
                registerPasswordBloc
                    .add(RegisterPasswordChanged(password: password));
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  registerPasswordBloc.add(ObscurePasswordToggled());
                },
                key: Key('obscure-toggle'),
                child: obscurePassword
                    ? ImageIconWidget(path: ImageIconPath.eyeOff)
                    : ImageIconWidget(path: ImageIconPath.eyeOn),
              ),
            );
          },
        ),
        SizedBox(
          height: 4,
        ),
        BlocSelector<RegisterPasswordBloc, RegisterPasswordState, bool>(
          selector: (state) {
            return state.isValidPassword;
          },
          builder: (context, isValidPassword) {
            return PasswordValidateText(
              isValid: isValidPassword,
            );
          },
        ),
        BlocSelector<RegisterPasswordBloc, RegisterPasswordState, bool>(
          selector: (state) {
            return state.obscurePasswordCheck;
          },
          builder: (context, obscurePasswordCheck) {
            return PrimaryTextField(
              hintText: '비밀번호를 입력해주세요',
              obscureText: obscurePasswordCheck,
              onChanged: (password) {
                registerPasswordBloc
                    .add(RegisterPasswordCheckChanged(password: password));
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  registerPasswordBloc.add(ObscurePasswordCheckToggled());
                },
                key: Key('obscure-toggle'),
                child: obscurePasswordCheck
                    ? ImageIconWidget(path: ImageIconPath.eyeOff)
                    : ImageIconWidget(path: ImageIconPath.eyeOn),
              ),
            );
          },
        ),
        SizedBox(
          height: 4,
        ),
        BlocSelector<RegisterPasswordBloc, RegisterPasswordState, bool>(
          selector: (state) {
            return state.isAvail;
          },
          builder: (context, isAvail) {
            return PasswordCheckValidateText(
              isValid: isAvail,
            );
          },
        ),
      ],
    );
  }
}
