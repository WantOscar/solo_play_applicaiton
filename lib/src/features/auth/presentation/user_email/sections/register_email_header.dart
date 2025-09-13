import 'package:flutter/widgets.dart';

class RegisterEmailHeader extends StatelessWidget {
  const RegisterEmailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          key: Key("header-up"),
          "로그인에 사용할",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000)),
        ),
        RichText(
          key: Key("header-bottom"),
          text: TextSpan(children: [
            TextSpan(
                text: "아이디",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff266FF7))),
            TextSpan(
              text: "를 입력해주세요.",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000)),
            ),
          ]),
        ),
      ],
    );
  }
}
