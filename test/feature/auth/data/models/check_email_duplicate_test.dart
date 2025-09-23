import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/check_email_duplicate.dart';

void main() {
  group(CheckEmailDuplicateRequest, () {
    const tEmail = 'test@example.com';
    final tCheckEmailDuplicateRequest =
        CheckEmailDuplicateRequest(email: tEmail);
    final tJsonMap = {'email': tEmail};

    test('should be a subclass of CheckEmailDuplicateRequest', () {
      expect(tCheckEmailDuplicateRequest, isA<CheckEmailDuplicateRequest>());
    });

    test('should correctly parse from JSON', () {
      final result = CheckEmailDuplicateRequest.fromJson(tJsonMap);
      expect(result, tCheckEmailDuplicateRequest);
    });

    test('should correctly convert to JSON', () {
      final result = tCheckEmailDuplicateRequest.toJson();
      expect(result, tJsonMap);
    });

    test('should support value equality', () {
      final instance1 = CheckEmailDuplicateRequest(email: tEmail);
      final instance2 = CheckEmailDuplicateRequest(email: tEmail);
      final instance3 =
          CheckEmailDuplicateRequest(email: 'another@example.com');

      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('should support copyWith', () {
      final updatedEmail = 'updated@example.com';
      final updatedInstance =
          tCheckEmailDuplicateRequest.copyWith(email: updatedEmail);

      expect(updatedInstance.email, updatedEmail);
      expect(updatedInstance, isNot(equals(tCheckEmailDuplicateRequest)));
    });
  });
}
