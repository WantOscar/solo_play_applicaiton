import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/sections/sections.dart';

void main() {
  group(LoginTextFieldsSection, () {
    late Widget widget;
    String email = "";
    String password = "";
    bool isObscureOn = true;
    setUp(() {
      widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: LoginTextFieldsSection(
              onEmailChanged: (value) => email = value,
              onPasswordChanged: (value) => password = value,
              isObscureOn: isObscureOn,
              onObscureToggle: () {
                isObscureOn = !isObscureOn;
              },
            ),
          ),
        ),
      );
    });

    tearDown(() {
      email = "";
      password = "";
      isObscureOn = true;
    });

    testWidgets('should render email text fields label = "이메일(아이디)" correctly',
        (tester) async {
      await tester.pumpWidget(widget);

      final textFinder = find.text("이메일(아이디)");
      expect(textFinder, findsOneWidget);

      final target = tester.widget<Text>(textFinder);
      expect(target.style?.color, Color(0xff000000));
      expect(target.style?.fontSize, 16);
      expect(target.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('should render password text fields label = "비밀번호" correctly',
        (tester) async {
      await tester.pumpWidget(widget);

      final textFinder = find.text("비밀번호");
      expect(textFinder, findsOneWidget);

      final target = tester.widget<Text>(textFinder);
      expect(target.style?.color, Color(0xff000000));
      expect(target.style?.fontSize, 16);
      expect(target.style?.fontWeight, FontWeight.w700);
    });

    testWidgets("should render email text field hintlabel = abc@test.com",
        (tester) async {
      await tester.pumpWidget(widget);
      final textFieldFinder = find.byKey(Key("email-fields"));
      expect(textFieldFinder, findsOneWidget);
      final target = tester.widget<PrimaryTextField>(textFieldFinder);
      expect(target.hintText, "abc@test.com");
      expect(target.hintStyle?.color, Color(0xffC3C3C3));
      expect(target.hintStyle?.fontSize, 16);
      expect(target.hintStyle?.fontWeight, FontWeight.w400);
    });

    testWidgets("should render password text field hintlabel = 8자 이상의 비밀번호",
        (tester) async {
      await tester.pumpWidget(widget);
      final textFieldFinder = find.byKey(Key("password-fields"));
      expect(textFieldFinder, findsOneWidget);
      final target = tester.widget<PrimaryTextField>(textFieldFinder);
      expect(target.hintText, "8자 이상의 비밀번호");
      expect(target.hintStyle?.color, Color(0xffC3C3C3));
      expect(target.hintStyle?.fontSize, 16);
      expect(target.hintStyle?.fontWeight, FontWeight.w400);
      expect(target.obscureText, true);
    });

    testWidgets('LoginTextFieldsSection has correct spacing', (tester) async {
      await tester.pumpWidget(widget);

      // 이메일 Text
      final emailTextFinder = find.text("이메일(아이디)");
      final emailFieldFinder = find.byKey(Key("email-fields"));

      // 위치 확인
      final emailTextBottom = tester.getBottomLeft(emailTextFinder).dy;
      final emailFieldTop = tester.getTopLeft(emailFieldFinder).dy;

      expect(emailFieldTop - emailTextBottom, 6);

      // 비밀번호 Text
      final passwordTextFinder = find.text("비밀번호");
      final passwordFieldFinder = find.byKey(Key("password-fields"));

      // 위치 확인
      final passwordTextBottom = tester.getBottomLeft(passwordTextFinder).dy;
      final passwordFieldTop = tester.getTopLeft(passwordFieldFinder).dy;

      expect(passwordFieldTop - passwordTextBottom, 6);

      final emailFiledBottom = tester.getBottomLeft(emailFieldFinder).dy;
      final passwordTextTop = tester.getTopLeft(passwordTextFinder).dy;

      expect(passwordTextTop - emailFiledBottom, 8);
    });

    testWidgets("should return new email when onEmailChanged called",
        (tester) async {
      await tester.pumpWidget(widget);
      final emailField = find.byKey(Key("email-fields"));
      await tester.enterText(emailField, "test@test.com");
      expect(email, "test@test.com");
    });

    testWidgets("should return new password when onPasswordChanged called",
        (tester) async {
      await tester.pumpWidget(widget);
      final emailField = find.byKey(Key("password-fields"));
      await tester.enterText(emailField, "test-password");
      expect(password, "test-password");
    });

    testWidgets("should render obscureIcon correctly", (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byIcon(Icons.remove_red_eye_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove_red_eye_outlined));

      // 변경된 상태로 위젯 다시 빌드
      widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: LoginTextFieldsSection(
              onEmailChanged: (value) => email = value,
              onPasswordChanged: (value) => password = value,
              isObscureOn: isObscureOn,
              onObscureToggle: () {
                isObscureOn = !isObscureOn;
              },
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);
    });

    testWidgets('should render correctly', (tester) async {
      await tester.pumpWidget(widget);
      expectLater(find.byType(LoginTextFieldsSection),
          matchesGoldenFile("goldens/login-text-fields-section-default.png"));
    });
  });
}
