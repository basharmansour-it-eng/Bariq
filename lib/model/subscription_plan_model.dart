import 'wash_service_model.dart';

/// باقة اشتراك شهري: عدد غسلات من خدمة معيّنة بخصم على السعر.
/// السعر لا يُخزَّن هنا، بل يُحسب من سعر الخدمة (انظر discountedPrice).
class SubscriptionPlan {
  final String id; // يُستخدم لمفاتيح الترجمة: plan_<id> و plan_<id>_desc
  final ServiceCategory category;
  final int washesPerMonth;
  final double discountPercent;
  final bool isPopular;

  const SubscriptionPlan({
    required this.id,
    required this.category,
    required this.washesPerMonth,
    required this.discountPercent,
    this.isPopular = false,
  });

  String get titleKey => 'plan_$id';
  String get descKey => 'plan_${id}_desc';
  bool get isWaterless => category == ServiceCategory.waterless;

  /// السعر الشهري بدون خصم، بالنسبة لسعر غسلة واحدة
  double regularPrice(double unitPrice) => unitPrice * washesPerMonth;

  /// السعر الشهري بعد الخصم
  double discountedPrice(double unitPrice) =>
      regularPrice(unitPrice) * (1 - discountPercent / 100);
}

/// بيانات تجريبية؛ ستأتي لاحقاً من Firestore.
const sampleSubscriptionPlans = <SubscriptionPlan>[
  SubscriptionPlan(
    id: 'basic',
    category: ServiceCategory.exterior,
    washesPerMonth: 4,
    discountPercent: 15,
  ),
  SubscriptionPlan(
    id: 'eco',
    category: ServiceCategory.waterless,
    washesPerMonth: 4,
    discountPercent: 15,
  ),
  SubscriptionPlan(
    id: 'premium',
    category: ServiceCategory.full,
    washesPerMonth: 4,
    discountPercent: 20,
    isPopular: true,
  ),
];