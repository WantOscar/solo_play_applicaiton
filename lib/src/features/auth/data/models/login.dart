import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';

part 'login.freezed.dart';
part 'login.g.dart';

/// 로그인 API 요청을 위한 DTO(Data Transfer Object) 클래스입니다.
@freezed
abstract class LoginRequest with _$LoginRequest {
  /// [LoginRequest] 인스턴스를 생성합니다.
  ///
  /// - [email] : 사용자 이메일
  /// - [password] : 사용자 비밀번호
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  /// JSON 맵에서 [LoginRequest] 인스턴스를 생성합니다.
  factory LoginRequest.fromJson(JsonMap json) => _$LoginRequestFromJson(json);
}
