class Validators {
  Validators._();

  /// رقم إماراتي محلي: 9 أرقام تبدأ بـ 5 (بدون 0 ولا +971). مثال: 501234567
  static bool isUaePhone(String value) =>
      RegExp(r'^5\d{8}$').hasMatch(value);

  static bool isEmail(String value) =>
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);

  static bool isValidName(String value) => value.trim().length >= 2;
}
