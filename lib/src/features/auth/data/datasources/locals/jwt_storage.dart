/// JWT(JSON Web Token)를 안전하게 로컬에 저장하고 관리하기 위한 추상 클래스입니다.
///
/// 이 클래스는 토큰의 저장, 읽기, 삭제 및 토큰 변경 감지를 위한 스트림을 정의합니다.
abstract class JwtStorage {
  /// 액세스 토큰의 변경을 감지할 수 있는 스트림입니다.
  ///
  /// 토큰이 저장되거나 삭제될 때 새로운 값을 스트림에 전달합니다.
  /// 앱의 인증 상태를 실시간으로 반영하는 데 사용됩니다.
  Stream<String?> get tokenStream;

  /// 액세스 토큰을 저장합니다.
  ///
  /// - [accessToken] : 저장할 액세스 토큰 문자열
  Future<void> saveAccessToken(String accessToken);

  /// 저장된 액세스 토큰을 읽어옵니다.
  ///
  /// 토큰이 없으면 `null`을 반환합니다.
  Future<String?> readAccessToken();

  /// 저장된 액세스 토큰을 삭제합니다.
  Future<void> deleteAccessToken();

  /// 리프레시 토큰을 저장합니다.
  ///
  /// - [refreshToken] : 저장할 리프레시 토큰 문자열
  Future<void> saveRefreshToken(String refreshToken);

  /// 저장된 리프레시 토큰을 읽어옵니다.
  ///
  /// 토큰이 없으면 `null`을 반환합니다.
  Future<String?> readRefreshToken();

  /// 저장된 리프레시 토큰을 삭제합니다.
  Future<void> deleteRefreshToken();

  /// 스트림 컨트롤러 등 사용된 리소스를 해제합니다.
  void dispose();
}
