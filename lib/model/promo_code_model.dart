/// كود خصم: نسبة مئوية و/أو مبلغ ثابت.
class PromoCode {
  final String code;
  final double percent;
  final double fixed; // بالدرهم

  const PromoCode({required this.code, this.percent = 0, this.fixed = 0});

  double discountFor(double subtotal) {
    final d = subtotal * percent / 100 + fixed;
    return d > subtotal ? subtotal : d;
  }
}

/// أكواد تجريبية للواجهة فقط.
/// لاحقاً: التحقق من الكود يتم في الخادم (Cloud Function) لا في التطبيق.
const samplePromoCodes = <PromoCode>[
  PromoCode(code: 'BARIQ10', percent: 10),
  PromoCode(code: 'WELCOME20', fixed: 20),
];