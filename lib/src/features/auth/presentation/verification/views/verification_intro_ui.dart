import 'package:flutter/material.dart';

import '../sections/verification_intro_section.dart';

class VerificationIntroUI extends StatelessWidget {
  const VerificationIntroUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 62.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VerificationIntroHeader(),
            VerificationIntroButtonSection(),
          ],
        ),
      ),
    );
  }
}
