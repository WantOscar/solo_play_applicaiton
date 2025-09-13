import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/utils/validators/password_validator.dart';

void main() {
  group(PasswordValidator, () {
    group('isValidPassword', () {
      test('should return true for valid password', () {
        expect(PasswordValidator.isValidPassword('Test123!'), true);
        expect(PasswordValidator.isValidPassword('MyPass123@'), true);
        expect(PasswordValidator.isValidPassword('Secure123#'), true);
      });

      test('should return false for password less than 8 characters', () {
        expect(PasswordValidator.isValidPassword('Test1!'), false);
        expect(PasswordValidator.isValidPassword('Ab1!'), false);
      });

      test('should return false for password without letters', () {
        expect(PasswordValidator.isValidPassword('12345678!'), false);
        expect(PasswordValidator.isValidPassword('987654321@'), false);
      });

      test('should return false for password without numbers', () {
        expect(PasswordValidator.isValidPassword('TestTest!'), false);
        expect(PasswordValidator.isValidPassword('Password@'), false);
      });

      test('should return false for password without special characters', () {
        expect(PasswordValidator.isValidPassword('Test1234'), false);
        expect(PasswordValidator.isValidPassword('MyPassword123'), false);
      });

      test('should return false for empty password', () {
        expect(PasswordValidator.isValidPassword(''), false);
      });
    });

    group('doPasswordsMatch', () {
      test('should return true when passwords match and are not empty', () {
        expect(
            PasswordValidator.doPasswordsMatch('Test123!', 'Test123!'), true);
        expect(PasswordValidator.doPasswordsMatch('MyPass123@', 'MyPass123@'),
            true);
      });

      test('should return false when passwords do not match', () {
        expect(
            PasswordValidator.doPasswordsMatch('Test123!', 'Test123@'), false);
        expect(PasswordValidator.doPasswordsMatch('MyPass123@', 'MyPass123#'),
            false);
      });

      test('should return false when one password is empty', () {
        expect(PasswordValidator.doPasswordsMatch('Test123!', ''), false);
        expect(PasswordValidator.doPasswordsMatch('', 'Test123!'), false);
      });

      test('should return false when both passwords are empty', () {
        expect(PasswordValidator.doPasswordsMatch('', ''), false);
      });
    });
  });
}
