import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/user_agreement.dart';

void main() {
  group('UserAgreement', () {
    const tIsOver14 = true;
    const tIsAgreedToTerms = true;
    const tIsAgreedToMarketing = false;
    const tIsConsentedToAds = false;
    final tUserAgreement = UserAgreement(
      isOver14: tIsOver14,
      isAgreedToTerms: tIsAgreedToTerms,
      isAgreedToMarketing: tIsAgreedToMarketing,
      isConsentedToAds: tIsConsentedToAds,
    );
    final tJsonMap = {
      'isOver14': tIsOver14,
      'isAgreedToTerms': tIsAgreedToTerms,
      'isAgreedToMarketing': tIsAgreedToMarketing,
      'isConsentedToAds': tIsConsentedToAds,
    };

    test('should be a subclass of UserAgreement', () {
      expect(tUserAgreement, isA<UserAgreement>());
    });

    test('should correctly parse from JSON', () {
      final result = UserAgreement.fromJson(tJsonMap);
      expect(result, tUserAgreement);
    });

    test('should correctly convert to JSON', () {
      final result = tUserAgreement.toJson();
      expect(result, tJsonMap);
    });

    test('should support value equality', () {
      final instance1 = UserAgreement(
        isOver14: tIsOver14,
        isAgreedToTerms: tIsAgreedToTerms,
        isAgreedToMarketing: tIsAgreedToMarketing,
        isConsentedToAds: tIsConsentedToAds,
      );
      final instance2 = UserAgreement(
        isOver14: tIsOver14,
        isAgreedToTerms: tIsAgreedToTerms,
        isAgreedToMarketing: tIsAgreedToMarketing,
        isConsentedToAds: tIsConsentedToAds,
      );
      final instance3 = UserAgreement(
        isOver14: false,
        isAgreedToTerms: false,
        isAgreedToMarketing: true,
        isConsentedToAds: true,
      );

      expect(instance1, equals(instance2));
      expect(instance1, isNot(equals(instance3)));
    });

    test('should support copyWith', () {
      final updatedIsAgreedToMarketing = true;
      final updatedInstance = tUserAgreement.copyWith(isAgreedToMarketing: updatedIsAgreedToMarketing);

      expect(updatedInstance.isAgreedToMarketing, updatedIsAgreedToMarketing);
      expect(updatedInstance, isNot(equals(tUserAgreement)));
    });
  });
}
