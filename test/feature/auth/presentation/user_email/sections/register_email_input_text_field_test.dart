import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';

import '../mocks/mock_user_email_bloc.dart';

void main() {
  group(RegisterEmailInputTextField, () {
    late MockUserEmailBloc mockUserEmailBloc;
    late Widget widget;

    setUp(() {
      mockUserEmailBloc = MockUserEmailBloc();
      when(() => mockUserEmailBloc.state).thenReturn(UserEmailState());
      widget = MaterialApp(
        home: BlocProvider<UserEmailBloc>.value(
          value: mockUserEmailBloc,
          child: Scaffold(
            body: Center(
              child: RegisterEmailInputTextField(),
            ),
          ),
        ),
      );
    });

    testWidgets('should render text field label correclty', (tester) async {
      await tester.pumpWidget(widget);
      final labelFinder = find.text("이메일(아이디)");

      expect(labelFinder, findsOneWidget);

      final label = tester.widget<Text>(labelFinder);

      expect(label.style?.fontSize, 16);
      expect(label.style?.fontWeight, FontWeight.w700);
      expect(label.style?.color, Color(0xff000000));
    });

    testWidgets('should render suffix correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(RegisterEmailValidateIconView), findsOneWidget);
    });

    testWidgets('should render email input textfield correctly',
        (tester) async {
      await tester.pumpWidget(widget);

      final textFieldFinder = find.byType(PrimaryTextField);

      expect(textFieldFinder, findsOneWidget);

      final hintLabelFinder = find.text("abc@email.com");

      expect(hintLabelFinder, findsOneWidget);

      final hintLabel = tester.widget<Text>(hintLabelFinder);

      expect(hintLabel.style?.fontSize, 16);
      expect(hintLabel.style?.color, Color(0xffc3c3c3));
      expect(hintLabel.style?.fontWeight, FontWeight.w400);
    });

    testWidgets('should render email input text field correctly',
        (tester) async {
      await tester.pumpWidget(widget);

      expectLater(
          find.byType(RegisterEmailInputTextField),
          matchesGoldenFile(
              "goldens/register-email-input-text-field-default.png"));
    });

    testWidgets(
        'should render email input text field correctly when email conflict',
        (tester) async {
      when(
        () => mockUserEmailBloc.state,
      ).thenReturn(
        UserEmailState(
            errorMessage: "이미 있는 아이디에요.", status: UserEmailStatus.conflict),
      );
      await tester.pumpWidget(widget);

      expectLater(
          find.byType(RegisterEmailInputTextField),
          matchesGoldenFile(
              "goldens/register-email-input-text-field-conflict.png"));
    });
  });
}
