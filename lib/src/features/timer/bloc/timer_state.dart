import 'package:equatable/equatable.dart';

/// 모든 타이머 상태의 기본 클래스입니다.
abstract class TimerState extends Equatable {
  /// 타이머의 남은 시간 (초) 입니다.
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

/// 타이머의 초기 상태입니다.
class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

/// 타이머가 실행 중일 때의 상태입니다.
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}



/// 타이머가 완료되었을 때의 상태입니다.
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}