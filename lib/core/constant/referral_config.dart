/// قيم برنامج الإحالات.
/// لاحقاً: تُقرأ من Firebase Remote Config، والمنح الفعلي في Cloud Function.
class ReferralConfig {
  /// خصم الصديق على أول غسلة (درهم)
  static const double friendDiscount = 20;

  /// رصيد صاحب الكود عندما يُتم صديقه أول غسلة (درهم)
  static const double referrerReward = 20;
}