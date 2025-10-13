import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/jwt.dart';

void main() {
  group(Jwt, () {
    const tGrantType = 'Bearer';
    const tAccessToken = 'someAccessToken';
    const tRefreshToken = 'someRefreshToken';
    final tJwt = Jwt(
      grantType: tGrantType,
      accessToken: tAccessToken,
      refreshToken: tRefreshToken,
    );
    final tJsonMap = {
      'grantType': tGrantType,
      'accessToken': tAccessToken,
      'refreshToken': tRefreshToken,
    };

    test('should be a subclass of Jwt', () {
      expect(tJwt, isA<Jwt>());
    });

    test('should correctly parse from JSON', () {
      final result = Jwt.fromJson(tJsonMap);
      expect(result, tJwt);
    });

    test('should correctly convert to JSON', () {
      final result = tJwt.toJson();
      expect(result, tJsonMap);
    });

    test('should support value equality', () {
      final instance1 = Jwt(
        grantType: tGrantType,
        accessToken: tAccessToken,
        refreshToken: tRefreshToken,
      );
      final instance2 = Jwt(
        grantType: tGrantType,
        accessToken: tAccessToken,
        refreshToken: tRefreshToken,
      );
      final instance3 = Jwt(
        grantType: 'AnotherType',
        accessToken: 'anotherAccessToken',
        refreshToken: 'anotherRefreshToken',
      );

      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('should support copyWith', () {
      final updatedAccessToken = 'updatedAccessToken';
      final updatedInstance = tJwt.copyWith(accessToken: updatedAccessToken);

      expect(updatedInstance.accessToken, updatedAccessToken);
      expect(updatedInstance, isNot(equals(tJwt)));
    });
  });
}
