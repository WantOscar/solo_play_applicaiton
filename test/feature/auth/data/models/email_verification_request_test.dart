import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/email_verification_request.dart';

void main() {
  group(EmailVerificationRequest, () {
    const tEmail = 'test@example.com';
    final tEmailVerificationRequest = EmailVerificationRequest(email: tEmail);
    final tJsonMap = {'email': tEmail};

    test('should be a subclass of EmailVerificationRequest', () {
      expect(tEmailVerificationRequest, isA<EmailVerificationRequest>());
    });

    test('should correctly parse from JSON', () {
      final result = EmailVerificationRequest.fromJson(tJsonMap);
      expect(result, tEmailVerificationRequest);
    });

    test('should correctly convert to JSON', () {
      final result = tEmailVerificationRequest.toJson();
      expect(result, tJsonMap);
    });

    test('should support value equality', () {
      final instance1 = EmailVerificationRequest(email: tEmail);
      final instance2 = EmailVerificationRequest(email: tEmail);
      final instance3 = EmailVerificationRequest(email: 'another@example.com');

      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('should support copyWith', () {
      final updatedEmail = 'updated@example.com';
      final updatedInstance =
          tEmailVerificationRequest.copyWith(email: updatedEmail);

      expect(updatedInstance.email, updatedEmail);
      expect(updatedInstance, isNot(equals(tEmailVerificationRequest)));
    });
  });
}
