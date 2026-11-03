import 'address_model.dart';
import 'car_model.dart';
import 'payment_method.dart';
import 'wash_service_model.dart';

/// auto = يُخصم تلقائياً كل شهر، manual = يجدّد العميل بنفسه بعد تذكير.
enum RenewalMode { auto, manual }

enum SubscriptionStatus { active, cancelled }

class SubscriptionModel {
  final String id;
  final String planId;
  final ServiceCategory category;
  final int washesPerMonth;
  final double discountPercent;
  final double monthlyPrice;
  final CarModel car;
  final AddressModel address;
  final int preferredWeekday; // 1 = الإثنين ... 7 = الأحد (مثل DateTime.weekday)
  final int preferredHour; // بداية الفترة المفضلة
  final RenewalMode renewalMode;
  final PaymentMethod paymentMethod;
  final DateTime startDate;
  final DateTime renewalDate;
  final SubscriptionStatus status;
  final int washesUsed;

  const SubscriptionModel({
    required this.id,
    required this.planId,
    required this.category,
    required this.washesPerMonth,
    required this.discountPercent,
    required this.monthlyPrice,
    required this.car,
    required this.address,
    required this.preferredWeekday,
    required this.preferredHour,
    required this.renewalMode,
    required this.paymentMethod,
    required this.startDate,
    required this.renewalDate,
    this.status = SubscriptionStatus.active,
    this.washesUsed = 0,
  });

  String get titleKey => 'plan_$planId';

  /// عدد الغسلات المتبقية هذا الشهر
int get washesRemaining =>
    (washesPerMonth - washesUsed).clamp(0, washesPerMonth).toInt();

  SubscriptionModel copyWith({
    SubscriptionStatus? status,
    RenewalMode? renewalMode,
    int? washesUsed,
  }) =>
      SubscriptionModel(
        id: id,
        planId: planId,
        category: category,
        washesPerMonth: washesPerMonth,
        discountPercent: discountPercent,
        monthlyPrice: monthlyPrice,
        car: car,
        address: address,
        preferredWeekday: preferredWeekday,
        preferredHour: preferredHour,
        renewalMode: renewalMode ?? this.renewalMode,
        paymentMethod: paymentMethod,
        startDate: startDate,
        renewalDate: renewalDate,
        status: status ?? this.status,
        washesUsed: washesUsed ?? this.washesUsed,
      );

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json['id'] as String,
        planId: json['plan_id'] as String,
        category: ServiceCategory.values.byName(json['category'] as String),
        washesPerMonth: json['washes_per_month'] as int,
        discountPercent: (json['discount_percent'] as num).toDouble(),
        monthlyPrice: (json['monthly_price'] as num).toDouble(),
        car: CarModel.fromJson(Map<String, dynamic>.from(json['car'] as Map)),
        address: AddressModel.fromJson(
            Map<String, dynamic>.from(json['address'] as Map)),
        preferredWeekday: json['preferred_weekday'] as int,
        preferredHour: json['preferred_hour'] as int,
        renewalMode: RenewalMode.values.byName(json['renewal_mode'] as String),
        paymentMethod:
            PaymentMethod.values.byName(json['payment_method'] as String),
        startDate: DateTime.parse(json['start_date'] as String),
        renewalDate: DateTime.parse(json['renewal_date'] as String),
        status: SubscriptionStatus.values.byName(json['status'] as String),
        washesUsed: json['washes_used'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'plan_id': planId,
        'category': category.name,
        'washes_per_month': washesPerMonth,
        'discount_percent': discountPercent,
        'monthly_price': monthlyPrice,
        'car': car.toJson(),
        'address': address.toJson(),
        'preferred_weekday': preferredWeekday,
        'preferred_hour': preferredHour,
        'renewal_mode': renewalMode.name,
        'payment_method': paymentMethod.name,
        'start_date': startDate.toIso8601String(),
        'renewal_date': renewalDate.toIso8601String(),
        'status': status.name,
        'washes_used': washesUsed,
      };
}