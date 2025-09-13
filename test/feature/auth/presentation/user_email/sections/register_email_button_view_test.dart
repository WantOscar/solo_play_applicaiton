import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/widgets/next_step_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';

import 'register_email_validate_text_view_test.dart';

void main() {
  group(RegisterEmailButtonView, () {
    late MockUserEmailBloc mockUserEmailBloc;
    late Widget widget;

    testWidgets('should render next step button correctly when initial state',
        (tester) async {
      mockUserEmailBloc = MockUserEmailBloc();
      when(() => mockUserEmailBloc.state).thenReturn(UserEmailState());
      widget = MaterialApp(
        home: BlocProvider<UserEmailBloc>.value(
          value: mockUserEmailBloc,
          child: Scaffold(
            body: Center(
              child: RegisterEmailButtonView(),
            ),
          ),
        ),
      );
      await tester.pumpWidget(widget);

      expect(find.byType(NextStepButton), findsOneWidget);

      expectLater(find.byType(RegisterEmailButtonView),
          matchesGoldenFile('goldens/register-email-button-view-default.png'));
    });

    testWidgets('should render next step button correctly when email valid',
        (tester) async {
      mockUserEmailBloc = MockUserEmailBloc();
      when(() => mockUserEmailBloc.state).thenReturn(UserEmailState(
          email: 'test@test.com', status: UserEmailStatus.valid));
      widget = MaterialApp(
        home: BlocProvider<UserEmailBloc>.value(
          value: mockUserEmailBloc,
          child: Scaffold(
            body: Center(
              child: RegisterEmailButtonView(),
            ),
          ),
        ),
      );
      await tester.pumpWidget(widget);
      expectLater(find.byType(RegisterEmailButtonView),
          matchesGoldenFile('goldens/register-email-button-view-active.png'));
    });
  });
}
