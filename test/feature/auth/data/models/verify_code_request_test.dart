import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code.dart';

void main() {
  group('VerifyCodeRequest', () {
    const tEmail = 'test@example.com';
    const tCode = '123456';
    final tVerifyCodeRequest = VerifyCodeRequest(email: tEmail, code: tCode);
    final tJsonMap = {'email': tEmail, 'code': tCode};

    test('should be a subclass of VerifyCodeRequest', () {
      expect(tVerifyCodeRequest, isA<VerifyCodeRequest>());
    });

    test('should correctly parse from JSON', () {
      final result = VerifyCodeRequest.fromJson(tJsonMap);
      expect(result, tVerifyCodeRequest);
    });

    test('should correctly convert to JSON', () {
      final result = tVerifyCodeRequest.toJson();
      expect(result, tJsonMap);
    });

    test('should support value equality', () {
      final instance1 = VerifyCodeRequest(email: tEmail, code: tCode);
      final instance2 = VerifyCodeRequest(email: tEmail, code: tCode);
      final instance3 =
          VerifyCodeRequest(email: 'another@example.com', code: '654321');

      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('should support copyWith', () {
      final updatedEmail = 'updated@example.com';
      final updatedInstance = tVerifyCodeRequest.copyWith(email: updatedEmail);

      expect(updatedInstance.email, updatedEmail);
      expect(updatedInstance, isNot(equals(tVerifyCodeRequest)));
    });
  });
}
