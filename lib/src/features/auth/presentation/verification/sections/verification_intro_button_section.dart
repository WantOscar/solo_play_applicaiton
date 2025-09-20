import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';

class VerificationIntroButtonSection extends StatelessWidget {
  const VerificationIntroButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: () {
        context.push(RouterPath.verficationEmail);
      },
      activeChild: Text(
        '본인인증 하러 가기',
        style: TextStyle(
            color: Color(0xffffffff),
            fontWeight: FontWeight.w700,
            fontSize: 16),
      ),
    );
  }
}
