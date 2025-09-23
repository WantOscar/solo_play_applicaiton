import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/data/models/register_request.dart';
import 'package:solo_play_application/src/features/auth/data/models/user_agreement.dart';

void main() {
  group('RegisterRequest', () {
    const String tEmail = 'test@example.com';
    const String tPassword = 'password123';
    const String tCode = '123456';

    final RegisterRequest tRegisterRequest = RegisterRequest(
        email: tEmail,
        password: tPassword,
        code: tCode,
        userAgreement: UserAgreement(
            isOver14: true,
            isAgreedToTerms: true,
            isAgreedToMarketing: true,
            isConsentedToAds: true));

    final Map<String, dynamic> tRegisterRequestJson = {
      'email': tEmail,
      'password': tPassword,
      'code': tCode,
      'userAgreement': {
        'isOver14': true,
        'isAgreedToTerms': true,
        'isAgreedToMarketing': true,
        'isConsentedToAds': true,
      }
    };

    test('should be a subclass of RegisterRequest entity', () {
      expect(tRegisterRequest, isA<RegisterRequest>());
    });

    test('should return a valid model from JSON', () {
      final result = RegisterRequest.fromJson(tRegisterRequestJson);
      expect(result, tRegisterRequest);
    });

    test('should return a JSON map containing the proper data', () {
      final result = tRegisterRequest.toJson();
      expect(result, tRegisterRequestJson);
    });
  });
}
