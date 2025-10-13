import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/resend_email_section.dart';

import '../mocks/mock_verification_bloc.dart';

void main() {
  late VerificationBloc mockVerificationBloc;

  setUp(() {
    mockVerificationBloc = MockVerificationBloc();
    when(() => mockVerificationBloc.state).thenReturn(const VerificationState());
  });

  group('ResendEmailSection', () {
    testWidgets(
        'should render PrimaryTextField and PrimaryButton with correct properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<VerificationBloc>.value(
            value: mockVerificationBloc,
            child: const Scaffold(
              body: ResendEmailSection(
                email: 'test@test.com',
              ),
            ),
          ),
        ),
      );

      final sectionFinder = find.byType(ResendEmailSection);
      expect(sectionFinder, findsOneWidget);

      final rowFinder =
          find.descendant(of: sectionFinder, matching: find.byType(Row));
      expect(rowFinder, findsOneWidget);

      final textFieldFinder = find.byType(PrimaryTextField);
      expect(textFieldFinder, findsOneWidget);

      final buttonFinder = find.byType(PrimaryButton);
      expect(buttonFinder, findsOneWidget);

      expect(find.text('재전송'), findsOneWidget);

      final Text buttonText = tester.widget(
          find.descendant(of: buttonFinder, matching: find.byType(Text)));
      expect(buttonText.style!.color, const Color(0xffffffff));
      expect(buttonText.style!.fontSize, 16);
      expect(buttonText.style!.fontWeight, FontWeight.w700);

      await expectLater(
        find.byType(ResendEmailSection),
        matchesGoldenFile('goldens/resend_email_section.png'),
      );
    });

    testWidgets(
        'should add VerificationEmailSent event to VerificationBloc when "재전송" button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<VerificationBloc>.value(
            value: mockVerificationBloc,
            child: const Scaffold(
              body: ResendEmailSection(
                email: 'test@test.com',
              ),
            ),
          ),
        ),
      );

      final buttonFinder = find.widgetWithText(PrimaryButton, '재전송');
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
      await tester.pump();

      verify(() => mockVerificationBloc.add(const VerificationEmailSent('test@test.com')))
          .called(1);
    });
  });
}
