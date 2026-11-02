import 'package:flutter/material.dart';

import 'car_model.dart';

/// أنواع الخدمات. الاسم (name) يُستخدم كمفتاح ترجمة: service_<name>
enum ServiceCategory { exterior, interior, full, waterless, polish, ceramic }

class WashService {
  final String id;
  final ServiceCategory category;

  /// السعر بالدرهم الإماراتي لكل نوع سيارة
  final Map<CarType, double> prices;
  final int durationMinutes;

  const WashService({
    required this.id,
    required this.category,
    required this.prices,
    required this.durationMinutes,
  });

  /// مفتاح اسم الخدمة، مثل: service_waterless
  String get titleKey => 'service_${category.name}';

  /// مفتاح وصف الخدمة، مثل: service_waterless_desc
  String get descKey => 'service_${category.name}_desc';

  bool get isWaterless => category == ServiceCategory.waterless;

  /// أقل سعر (يظهر في البطاقات: "من 35")
  double get fromPrice => prices.values.reduce((a, b) => a < b ? a : b);

  double priceFor(CarType type) => prices[type] ?? fromPrice;

  /// مفاتيح ترجمة ما تشمله الخدمة
  List<String> get includesKeys {
    switch (category) {
      case ServiceCategory.exterior:
        return const [
          'inc_hand_wash',
          'inc_rims_tires',
          'inc_windows',
          'inc_dry_finish',
        ];
      case ServiceCategory.interior:
        return const [
          'inc_vacuum',
          'inc_dashboard',
          'inc_windows',
          'inc_door_jambs',
        ];
      case ServiceCategory.full:
        return const [
          'inc_hand_wash',
          'inc_rims_tires',
          'inc_windows',
          'inc_dry_finish',
          'inc_vacuum',
          'inc_dashboard',
          'inc_door_jambs',
        ];
      case ServiceCategory.waterless:
        return const [
          'inc_waterless_product',
          'inc_rims_tires',
          'inc_windows',
          'inc_dry_finish',
        ];
      case ServiceCategory.polish:
        return const ['inc_hand_wash', 'inc_polish', 'inc_wax'];
      case ServiceCategory.ceramic:
        return const [
          'inc_paint_prep',
          'inc_polish',
          'inc_ceramic',
          'inc_gloss',
        ];
    }
  }

  IconData get icon {
    switch (category) {
      case ServiceCategory.exterior:
        return Icons.local_car_wash_rounded;
      case ServiceCategory.interior:
        return Icons.airline_seat_recline_normal_rounded;
      case ServiceCategory.full:
        return Icons.auto_awesome_rounded;
      case ServiceCategory.waterless:
        return Icons.water_drop_outlined;
      case ServiceCategory.polish:
        return Icons.shield_moon_rounded;
      case ServiceCategory.ceramic:
        return Icons.diamond_outlined;
    }
  }

  factory WashService.fromJson(Map<String, dynamic> json) => WashService(
        id: json['id'].toString(),
        category: ServiceCategory.values.byName(json['category'] as String),
        durationMinutes: json['duration_minutes'] as int,
        prices: (json['prices'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(CarType.values.byName(k), (v as num).toDouble()),
        ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category.name,
        'duration_minutes': durationMinutes,
        'prices': prices.map((k, v) => MapEntry(k.name, v)),
      };
}