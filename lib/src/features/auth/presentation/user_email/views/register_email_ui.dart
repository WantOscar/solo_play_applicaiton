import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';

class RegisterEmailUI extends StatelessWidget {
  const RegisterEmailUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 62.0, horizontal: 16.0),
        child: SafeArea(
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterEmailHeader(),
                  SizedBox(
                    height: 48,
                  ),
                  RegisterEmailInputTextField(),
                  SizedBox(
                    height: 4,
                  ),
                  RegisterEmailValidateTextView(),
                ],
              ),
              RegisterEmailButtonView(),
            ],
          ),
        ),
      ),
    );
  }
}
