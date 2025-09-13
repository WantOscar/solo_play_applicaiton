import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/presentation/pages/timer_page.dart';
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart';

void main() {
  group(TimerPage, () {
    testWidgets('provides TimerBloc to TimerView', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: TimerPage()));

      // Check if TimerView is present
      expect(find.byType(TimerView), findsOneWidget);

      // Check if TimerBloc is provided
      final timerView = tester.element(find.byType(TimerView));
      final timerBloc = BlocProvider.of<TimerBloc>(timerView);
      expect(timerBloc, isA<TimerBloc>());
    });
  });
}
