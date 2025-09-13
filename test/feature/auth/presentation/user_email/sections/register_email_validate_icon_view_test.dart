import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/widgets/validation_icon.dart';

import 'register_email_validate_text_view_test.dart';

void main() {
  group(RegisterEmailValidateIconView, () {
    group('given email is blank', () {
      group('given isValid true', () {
        late MockUserEmailBloc mockUserEmailBloc;
        late Widget widget;

        setUp(() {
          mockUserEmailBloc = MockUserEmailBloc();
          when(() => mockUserEmailBloc.state).thenReturn(UserEmailState());
          widget = MaterialApp(
            home: BlocProvider<UserEmailBloc>.value(
              value: mockUserEmailBloc,
              child: RegisterEmailValidateIconView(),
            ),
          );
        });

        testWidgets('should return empty', (tester) async {
          await tester.pumpWidget(widget);

          final iconFinder = find.byType(ValidationIcon);

          expect(iconFinder, findsNothing);
        });
      });
    });
    group('given isValid true', () {
      late MockUserEmailBloc mockUserEmailBloc;
      late Widget widget;

      setUp(() {
        mockUserEmailBloc = MockUserEmailBloc();
        when(() => mockUserEmailBloc.state).thenReturn(UserEmailState(
            email: 'test@test.com', status: UserEmailStatus.valid));
        widget = MaterialApp(
          home: BlocProvider<UserEmailBloc>.value(
            value: mockUserEmailBloc,
            child: RegisterEmailValidateIconView(),
          ),
        );
      });

      testWidgets('should return isValid true', (tester) async {
        await tester.pumpWidget(widget);

        final iconFinder = find.byType(ValidationIcon);

        expect(iconFinder, findsOneWidget);
        final icon = tester.widget<ValidationIcon>(iconFinder);
        expect(icon.isValid, true);
      });
    });

    group('given isValid false', () {
      late MockUserEmailBloc mockUserEmailBloc;
      late Widget widget;

      setUp(() {
        mockUserEmailBloc = MockUserEmailBloc();
        when(() => mockUserEmailBloc.state).thenReturn(
            UserEmailState(email: "test@", status: UserEmailStatus.invalid));
        widget = MaterialApp(
          home: BlocProvider<UserEmailBloc>.value(
            value: mockUserEmailBloc,
            child: RegisterEmailValidateIconView(),
          ),
        );
      });

      testWidgets('should return isValid false', (tester) async {
        await tester.pumpWidget(widget);

        final iconFinder = find.byType(ValidationIcon);

        expect(iconFinder, findsOneWidget);
        final icon = tester.widget<ValidationIcon>(iconFinder);
        expect(icon.isValid, false);
      });
    });
  });
}
