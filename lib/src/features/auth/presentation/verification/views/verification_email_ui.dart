import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_email_header.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_code_input_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/resend_email_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_confirm_button_section.dart';

class VerificationEmailUi extends StatelessWidget {
  // Changed to StatelessWidget
  const VerificationEmailUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 62.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerificationEmailHeader(),
                SizedBox(
                  height: 85,
                ),
                VerificationCodeInputSection(),
                ResendEmailSection(),
              ],
            ),
            VerificationConfirmButtonSection(),
          ],
        ),
      ),
    );
  }
}
