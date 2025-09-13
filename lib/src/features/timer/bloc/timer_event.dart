import 'package:equatable/equatable.dart';

/// 모든 타이머 이벤트의 기본 클래스입니다.
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

/// 타이머가 시작되었음을 나타내는 이벤트입니다.
class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}



/// 타이머가 재설정되었음을 나타내는 이벤트입니다.
class TimerReset extends TimerEvent {
  const TimerReset();
}

/// 틱이 발생했음을 나타내는 내부 이벤트입니다.
class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}