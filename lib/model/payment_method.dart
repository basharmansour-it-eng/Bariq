import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PaymentMethod { card, applePay, googlePay, cash }

extension PaymentMethodX on PaymentMethod {
  /// مفتاح الترجمة: pay_card ...
  String get labelKey => 'pay_$name';

  /// وصف مختصر اختياري تحت الاسم
  String? get hintKey {
    switch (this) {
      case PaymentMethod.card:
        return 'pay_card_hint';
      case PaymentMethod.cash:
        return 'pay_cash_hint';
      case PaymentMethod.applePay:
      case PaymentMethod.googlePay:
        return null;
    }
  }

  IconData get icon {
    switch (this) {
      case PaymentMethod.card:
        return Icons.credit_card_rounded;
      case PaymentMethod.applePay:
        return Icons.phone_iphone_rounded;
      case PaymentMethod.googlePay:
        return Icons.account_balance_wallet_rounded;
      case PaymentMethod.cash:
        return Icons.payments_rounded;
    }
  }
}

/// الطرق المتاحة على المنصة الحالية: Apple Pay لآيفون، وGoogle Pay لأندرويد.
List<PaymentMethod> availablePaymentMethods() {
  final platform = defaultTargetPlatform;
  return [
    PaymentMethod.card,
    if (platform == TargetPlatform.iOS) PaymentMethod.applePay,
    if (platform == TargetPlatform.android) PaymentMethod.googlePay,
    PaymentMethod.cash,
  ];
}