/// 틱 스트림을 제공하는 클래스입니다.
class Ticker {
  /// const [Ticker]를 생성합니다.
  const Ticker();

  /// 매초 값을 방출하는 정수 스트림을 반환합니다.
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}