import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_event.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';
import 'package:solo_play_application/src/core/utils/ticker.dart';

class MockTicker extends Mock implements Ticker {}

void main() {
  group(TimerBloc, () {
    late Ticker ticker;
    late StreamController<int> controller;

    setUp(() {
      ticker = MockTicker();
      controller = StreamController<int>();
      when(() => ticker.tick(ticks: any(named: 'ticks')))
          .thenAnswer((_) => controller.stream);
    });

    tearDown(() {
      controller.close();
    });

    const int initialDuration = 600;

    test('initial state is TimerInitial(600)', () {
      expect(
        TimerBloc(ticker: ticker).state,
        const TimerInitial(initialDuration),
      );
    });

    blocTest<TimerBloc, TimerState>(
      'emits [TimerRunInProgress] * 5 when timer is started',
      build: () {
        when(() => ticker.tick(ticks: 5))
            .thenAnswer((_) => Stream<int>.fromIterable([4, 3, 2, 1, 0]));
        return TimerBloc(ticker: ticker);
      },
      act: (bloc) => bloc.add(const TimerStarted(duration: 5)),
      expect: () => [
        const TimerRunInProgress(5),
        const TimerRunInProgress(4),
        const TimerRunInProgress(3),
        const TimerRunInProgress(2),
        const TimerRunInProgress(1),
        const TimerRunComplete(),
      ],
    );

    blocTest<TimerBloc, TimerState>(
      'emits [TimerInitial] when timer is reset',
      build: () => TimerBloc(ticker: ticker),
      act: (bloc) {
        bloc.add(const TimerStarted(duration: 5));
        bloc.add(const TimerReset());
      },
      expect: () => [
        const TimerRunInProgress(5),
        const TimerInitial(initialDuration),
      ],
    );
  });
}
