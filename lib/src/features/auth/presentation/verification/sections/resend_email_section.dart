import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';

class ResendEmailSection extends StatelessWidget {
  const ResendEmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            // Wrapped PrimaryTextField in SizedBox
            height: 50, // Set height to 50
            child: PrimaryTextField(),
          ),
        ),
        const SizedBox(width: 8), // Spacing between text field and button
        PrimaryButton(
          height: 50, // Set height to 50
          onTap: () {
            // TODO: Implement resend email logic
          },
          child: const Text(
            '재전송',
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
