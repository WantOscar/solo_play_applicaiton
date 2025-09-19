import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_complete/sections/register_complete_header.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_complete/sections/register_complete_button_section.dart';

class RegisterCompleteUi extends StatelessWidget {
  const RegisterCompleteUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 62.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RegisterCompleteHeader(),
            RegisterCompleteButtonSection(),
          ],
        ),
      ),
    );
  }
}
