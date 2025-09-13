import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';

class MockUserEmailBloc extends MockBloc<UserEmailEvent, UserEmailState>
    implements UserEmailBloc {}

void main() {
  group(RegisterEmailValidateTextView, () {
    late MockUserEmailBloc mockUserEmailBloc;

    late Widget widget;

    setUp(() {
      mockUserEmailBloc = MockUserEmailBloc();
      final state = UserEmailState(errorMessage: 'error');
      when(() => mockUserEmailBloc.state).thenReturn(state);

      widget = MaterialApp(
        home: BlocProvider<UserEmailBloc>.value(
          value: mockUserEmailBloc,
          child: Scaffold(
            body: Center(
              child: RegisterEmailValidateTextView(),
            ),
          ),
        ),
      );
    });

    testWidgets('should text property correctly', (tester) async {
      await tester.pumpWidget(widget);

      final textFinder = find.byType(Text);

      expect(textFinder, findsOneWidget);

      final text = tester.widget<Text>(textFinder);

      expect(text.style?.fontSize, 12);
      expect(text.style?.color, Color(0xffFF0000));
      expect(text.style?.fontWeight, FontWeight.w400);
    });

    testWidgets('should render error message correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.text('error'), findsOneWidget);

      expectLater(
          find.byType(RegisterEmailValidateTextView),
          matchesGoldenFile(
              'goldens/register-email-validate-text-view-default.png'));
    });
  });
}
