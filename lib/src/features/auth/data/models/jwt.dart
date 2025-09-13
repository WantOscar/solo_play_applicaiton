import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';

part 'jwt.freezed.dart';
part 'jwt.g.dart';

/// 서버로부터 받은 JWT(JSON Web Token) 정보를 담는 DTO 클래스입니다.
@freezed
abstract class Jwt with _$Jwt {
  /// [Jwt] 인스턴스를 생성합니다.
  ///
  /// - [grantType] : 토큰 타입 (예: "Bearer")
  /// - [accessToken] : API 요청 시 인증에 사용되는 액세스 토큰
  /// - [refreshToken] : 액세스 토큰 만료 시 재발급에 사용되는 리프레시 토큰
  const factory Jwt({
    required String grantType,
    required String accessToken,
    required String refreshToken,
  }) = _Jwt;

  /// JSON 맵에서 [Jwt] 인스턴스를 생성합니다.
  factory Jwt.fromJson(JsonMap json) => _$JwtFromJson(json);
}
