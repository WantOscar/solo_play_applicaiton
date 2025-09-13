import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/typedefs/json_map.dart';

part 'check_email_duplicate.freezed.dart';
part 'check_email_duplicate.g.dart';

/// 이메일 중복 확인 API 요청을 위한 DTO(Data Transfer Object) 클래스입니다.
@freezed
abstract class CheckEmailDuplicateRequest with _$CheckEmailDuplicateRequest {
  /// [CheckEmailDuplicateRequest] 인스턴스를 생성합니다.
  ///
  /// - [email] : 중복 확인할 이메일 주소
  const factory CheckEmailDuplicateRequest({
    required String email,
  }) = _CheckEmailDuplicateRequest;

  /// JSON 맵에서 [CheckEmailDuplicateRequest] 인스턴스를 생성합니다.
  factory CheckEmailDuplicateRequest.fromJson(JsonMap json) =>
      _$CheckEmailDuplicateRequestFromJson(json);
}
