import 'package:bloc_test/bloc_test.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_event.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';

class MockTimerBloc extends MockBloc<TimerEvent, TimerState>
    implements TimerBloc {}
