import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/sections/sections.dart';

class RegisterPasswordUI extends StatelessWidget {
  const RegisterPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
                    RegisterPasswordHeader(),
                    SizedBox(height: 48),
                    RegisterPasswordInputTextField(),
                    SizedBox(height: 4),
                  ],
                ),
                RegisterPasswordButtonView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
