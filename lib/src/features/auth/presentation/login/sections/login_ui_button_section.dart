import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/core/widgets/secondary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/bloc.dart';

class LoginUiButtonSection extends StatelessWidget {
  final void Function()? onLoginButtonTap;
  final void Function()? onSignupButtonTap;
  const LoginUiButtonSection(
      {super.key, this.onLoginButtonTap, this.onSignupButtonTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          onTap: () {
            context.read<LoginBloc>().add(LoginButtonTap());
          },
          activeChild: Text(
            "로그인",
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        SecondaryButton(
          onTap: () {
            context.push(RouterPath.registerTerms);
          },
          child: Text(
            "이메일로 회원가입",
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
