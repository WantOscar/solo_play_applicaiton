import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/jwt_storage.dart';

/// [JwtStorage]의 구현체입니다.
///
/// [FlutterSecureStorage]를 사용하여 토큰을 안전하게 기기에 저장합니다.
/// 또한, [StreamController]를 사용하여 액세스 토큰의 변경 사항을 스트림으로 외부에 알립니다.
class JwtStorageImpl extends JwtStorage {
  /// 안전한 로컬 저장을 위한 [FlutterSecureStorage] 인스턴스
  final FlutterSecureStorage _storage;

  /// 액세스 토큰의 변경 사항을 전파하기 위한 스트림 컨트롤러
  ///
  /// `broadcast()`를 사용하여 여러 리스너가 구독할 수 있도록 설정합니다.
  late final StreamController<String?> _tokenStreamController;

  /// [JwtStorageImpl] 생성자
  ///
  /// - [storage] : 외부에서 주입받는 [FlutterSecureStorage] 인스턴스
  JwtStorageImpl({
    required FlutterSecureStorage storage,
  }) : _storage = storage {
    _tokenStreamController = StreamController.broadcast();
    _init();
  }

  void _init() async {
    final accessToken = await readAccessToken();
    _tokenStreamController.add(accessToken);
  }

  @override
  Stream<String?> get tokenStream => _tokenStreamController.stream;

  /// [FlutterSecureStorage]에 사용될 액세스 토큰의 키
  @visibleForTesting
  static const accessTokenKey = 'access_token';

  /// [FlutterSecureStorage]에 사용될 리프레시 토큰의 키
  @visibleForTesting
  static const refreshTokenKey = 'refresh_token';

  /// 액세스 토큰을 안전하게 저장하고, 변경 사항을 스트림에 알립니다.
  @override
  Future<void> saveAccessToken(String accessToken) async {
    // 스토리지에 토큰 저장
    await _storage.write(key: accessTokenKey, value: accessToken);
    // 스트림에 변경된 토큰 값 전파
    _tokenStreamController.add(accessToken);
  }

  /// 리프레시 토큰을 안전하게 저장합니다.
  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: refreshTokenKey, value: refreshToken);
  }

  /// 저장된 액세스 토큰을 읽어옵니다.
  @override
  Future<String?> readAccessToken() async {
    return await _storage.read(key: accessTokenKey);
  }

  /// 저장된 리프레시 토큰을 읽어옵니다.
  @override
  Future<String?> readRefreshToken() async {
    return await _storage.read(key: refreshTokenKey);
  }

  /// 저장된 액세스 토큰을 삭제하고, 변경 사항(null)을 스트림에 알립니다.
  @override
  Future<void> deleteAccessToken() async {
    // 스토리지에서 토큰 삭제
    await _storage.delete(key: accessTokenKey);
    // 스트림에 토큰이 삭제되었음(null)을 전파
    _tokenStreamController.add(null);
  }

  /// 저장된 리프레시 토큰을 삭제합니다.
  @override
  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: refreshTokenKey);
  }

  /// 스트림 컨트롤러를 닫아 리소스를 해제합니다.
  @override
  void dispose() {
    _tokenStreamController.close();
  }
}
