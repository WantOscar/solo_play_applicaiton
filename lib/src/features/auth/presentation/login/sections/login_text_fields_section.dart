import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';

class LoginTextFieldsSection extends StatelessWidget {
  final ValueChanged<String>? onEmailChanged;
  final ValueChanged<String>? onPasswordChanged;
  final void Function()? onObscureToggle;
  final bool isObscureOn;
  const LoginTextFieldsSection({
    super.key,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.isObscureOn = false,
    this.onObscureToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
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
        PrimaryTextField(
          onChanged: onEmailChanged,
          key: Key("email-fields"),
          hintText: "abc@test.com",
          hintStyle: TextStyle(
              color: Color(0xffC3C3C3),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "비밀번호",
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 6,
        ),
        PrimaryTextField(
          suffixIcon: GestureDetector(
            key: Key('obscure-toggle'),
            onTap: onObscureToggle,
            child: Icon(isObscureOn
                ? Icons.remove_red_eye_outlined
                : Icons.remove_red_eye),
          ),
          obscureText: isObscureOn,
          onChanged: onPasswordChanged,
          key: Key("password-fields"),
          hintText: "8자 이상의 비밀번호",
          hintStyle: TextStyle(
              color: Color(0xffC3C3C3),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
