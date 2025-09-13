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
        child: const TimerView(),
      ),
    );
  }

  group(TimerView, () {
    testWidgets('renders initial time (10:00) when state is TimerInitial',
        (WidgetTester tester) async {
      const state = TimerInitial(600);
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('10:00'), findsOneWidget);
    });

    testWidgets('renders formatted time when state is TimerRunInProgress',
        (WidgetTester tester) async {
      const state = TimerRunInProgress(599);
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('09:59'), findsOneWidget);
    });

    testWidgets('renders 00:00 when state is TimerRunComplete',
        (WidgetTester tester) async {
      const state = TimerRunComplete();
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets('has correct text style', (WidgetTester tester) async {
      const state = TimerInitial(600);
      when(() => timerBloc.state).thenReturn(state);
      timerStateController.add(state);
      await tester.pumpWidget(createWidgetUnderTest());
      final textWidget = tester.widget<Text>(find.text('10:00'));
      expect(textWidget.style?.fontSize, 14);
      expect(textWidget.style?.fontWeight, FontWeight.w400);
      expect(textWidget.style?.color, const Color(0xff8E8E8E));
    });
  });
}
