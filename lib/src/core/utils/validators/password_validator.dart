class PasswordValidator {
  static bool isValidPassword(String password) {
    if (password.length < 8 || password.length > 20) return false;

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasNumber = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasUppercase && hasLowercase && hasNumber && hasSpecialChar;
  }

  static bool doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword && password.isNotEmpty;
  }
}
