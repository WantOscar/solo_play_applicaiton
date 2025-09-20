import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/utils/ticker.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart';

/// 타이머를 표시하는 페이지입니다.
///
/// 이 페이지는 [TimerBloc]을 생성하고 [TimerView]에 제공하는 역할을 합니다.
class TimerPage extends StatelessWidget {
  /// const [TimerPage]를 생성합니다.
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}
