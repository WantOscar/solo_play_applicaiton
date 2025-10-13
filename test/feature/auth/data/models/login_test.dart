import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/login.dart';

void main() {
  group(LoginRequest, () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123';
    final tLoginRequest = LoginRequest(email: tEmail, password: tPassword);
    final tJsonMap = {'email': tEmail, 'password': tPassword};

    test('should be a subclass of LoginRequest', () {
      expect(tLoginRequest, isA<LoginRequest>());
    });

    test('should correctly parse from JSON', () {
      final result = LoginRequest.fromJson(tJsonMap);
      expect(result, tLoginRequest);
    });

    test('should correctly convert to JSON', () {
      final result = tLoginRequest.toJson();
      expect(result, tJsonMap);
    });

    test('should support value equality', () {
      final instance1 = LoginRequest(email: tEmail, password: tPassword);
      final instance2 = LoginRequest(email: tEmail, password: tPassword);
      final instance3 = LoginRequest(
          email: 'another@example.com', password: 'anotherPassword');

      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('should support copyWith', () {
      final updatedEmail = 'updated@example.com';
      final updatedInstance = tLoginRequest.copyWith(email: updatedEmail);

      expect(updatedInstance.email, updatedEmail);
      expect(updatedInstance, isNot(equals(tLoginRequest)));
    });
  });
}
