import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/proof_token_storage.dart';

/// [ProofTokenStorage]의 구현체
///
/// 이 클래스는 [FlutterSecureStorage]를 사용하여 본인인증 완료 후 발급되는
/// 임시 토큰(Proof Token)을 안전하게 디바이스에 저장하고 삭제하는 역할을 담당합니다.
class ProofTokenStorageImpl implements ProofTokenStorage {
  /// 보안 저장소와 통신하기 위한 [FlutterSecureStorage] 인스턴스
  final FlutterSecureStorage _storage;

  /// [ProofTokenStorageImpl] 생성자
  ///
  /// - [storage] : 외부에서 주입받는 [FlutterSecureStorage] 클라이언트 (테스트 시 Mocking 가능)
  ProofTokenStorageImpl({required FlutterSecureStorage storage})
      : _storage = storage;

  /// 저장소에서 사용될 토큰의 키 (Key) - 테스트 코드에서만 접근 가능
  @visibleForTesting
  static const proofTokenKey = 'proof_token';

  /// 본인인증 임시 토큰을 저장합니다.
  ///
  /// [proofToken]을 인자로 받아 [_proofTokenKey]를 키로 사용하여
  /// [FlutterSecureStorage]에 저장합니다.
  @override
  Future<void> saveProofToken(String proofToken) async {
    await _storage.write(key: proofTokenKey, value: proofToken);
  }

  @override
  Future<String?> readProofToken() async {
    return await _storage.read(key: proofTokenKey);
  }

  /// 저장된 본인인증 임시 토큰을 삭제합니다.
  ///
  /// [_proofTokenKey]를 사용하여 [FlutterSecureStorage]에서 해당 토큰을 삭제합니다.
  @override
  Future<void> deleteProofToken() async {
    await _storage.delete(key: proofTokenKey);
  }
}
