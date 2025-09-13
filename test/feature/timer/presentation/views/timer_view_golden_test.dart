import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart';

class MockTimerBloc extends Mock implements TimerBloc {}

void main() {
  late TimerBloc timerBloc;
  late StreamController<TimerState> timerStateController;

  setUp(() {
    timerBloc = MockTimerBloc();
    timerStateController = StreamController<TimerState>.broadcast();
    when(() => timerBloc.stream).thenAnswer((_) => timerStateController.stream);
  });

  tearDown(() {
    timerStateController.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<TimerBloc>.value(
        value: timerBloc,
        child: Scaffold(body: Center(child: const TimerView())),
      ),
    );
  }

  group('TimerView Golden Tests', () {
    testWidgets('renders correctly for TimerInitial',
        (WidgetTester tester) async {
      const state = TimerInitial(600);
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);

      await tester.pumpWidget(createWidgetUnderTest());

      await expectLater(
        find.byType(TimerView),
        matchesGoldenFile('goldens/timer_view_initial.png'),
      );
    });

    testWidgets('renders correctly for TimerRunInProgress',
        (WidgetTester tester) async {
      const state = TimerRunInProgress(599);
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);

      await tester.pumpWidget(createWidgetUnderTest());

      await expectLater(
        find.byType(TimerView),
        matchesGoldenFile('goldens/timer_view_run_in_progress.png'),
      );
    });

    testWidgets('renders correctly for TimerRunComplete',
        (WidgetTester tester) async {
      const state = TimerRunComplete();
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);

      await tester.pumpWidget(createWidgetUnderTest());

      await expectLater(
        find.byType(TimerView),
        matchesGoldenFile('goldens/timer_view_run_complete.png'),
      );
    });
  });
}
