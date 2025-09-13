import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/sections/sections.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/views/register_password_ui.dart';

import '../mocks/mock_register_password_bloc.dart';

void main() {
  group('ResisterPasswordUI', () {
    late MockRegisterPasswordBloc mockBloc;
    late Widget widget;

    setUp(() {
      mockBloc = MockRegisterPasswordBloc();
      when(() => mockBloc.state).thenReturn(RegisterPasswordState());

      widget = MaterialApp(
        home: BlocProvider<RegisterPasswordBloc>.value(
          value: mockBloc,
          child: RegisterPasswordUI(),
        ),
      );
    });
    testWidgets('should render all required sections',
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      // Header section should be present
      expect(find.byType(RegisterPasswordHeader), findsOneWidget);

      // Input text field should be present
      expect(find.byType(RegisterPasswordInputTextField), findsOneWidget);

      // Button view should be present
      expect(find.byType(RegisterPasswordButtonView), findsOneWidget);
    });

    testWidgets('should render correctly', (tester) async {
      await tester.pumpWidget(widget);

      expectLater(find.byType(RegisterPasswordUI),
          matchesGoldenFile('goldens/resister-password-ui-default.png'));
    });
  });
}
