import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';

import '../bloc/bloc.dart';
import '../cubits/password_visibility_cubit.dart';
import '../sections/sections.dart';
import '../widgets/widgets.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginUiTitleSection(),
                  const SizedBox(
                    height: 48,
                  ),
                  BlocBuilder<PasswordVisibilityCubit, bool>(
                    builder: (context, isObscureOn) {
                      return LoginTextFieldsSection(
                        onEmailChanged: (email) {
                          loginBloc.add(LoginEmailChanged(email: email));
                        },
                        onPasswordChanged: (password) {
                          loginBloc
                              .add(LoginPasswordChanged(password: password));
                        },
                        isObscureOn: isObscureOn,
                        onObscureToggle:
                            context.read<PasswordVisibilityCubit>().toggle,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  LoginUiButtonSection(
                    onLoginButtonTap: () {},
                    onSignupButtonTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabelButton(label: "계정찾기"),
                      const SizedBox(
                        width: 34,
                        height: 12,
                        child: VerticalDivider(
                          indent: 1,
                          color: Color(0xff8e8e8e),
                        ),
                      ),
                      LabelButton(label: "비밀번호 변경"),
                      const SizedBox(
                        width: 34,
                        height: 12,
                        child: VerticalDivider(
                          indent: 1,
                          color: Color(0xff8e8e8e),
                        ),
                      ),
                      LabelButton(label: "문의하기"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
