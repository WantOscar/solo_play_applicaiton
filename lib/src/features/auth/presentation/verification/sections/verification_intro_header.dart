import 'package:flutter/widgets.dart';

class VerificationIntroHeader extends StatelessWidget {
  const VerificationIntroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '본인인증을\n진행해주세요',
          style: TextStyle(
              color: Color(0xff000000),
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          '본인 인증 후 더 빠르게 서비스를 이용하세요!',
          style: TextStyle(
              color: Color(0xff666666),
              fontWeight: FontWeight.w400,
              fontSize: 16),
        ),
      ],
    );
  }
}
