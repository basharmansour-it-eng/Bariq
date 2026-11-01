import 'package:flutter/material.dart';

enum ServiceCategory { exterior, interior, full, waterless, polish, ceramic }

class WashService {
  final String id;
  final ServiceCategory category;
  final double fromPrice; // بالدرهم الإماراتي
  final int durationMinutes;

  const WashService({
    required this.id,
    required this.category,
    required this.fromPrice,
    required this.durationMinutes,
  });

  /// مفتاح الترجمة، مثل: service_waterless
  String get titleKey => 'service_${category.name}';

  bool get isWaterless => category == ServiceCategory.waterless;

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
        fromPrice: (json['from_price'] as num).toDouble(),
        durationMinutes: json['duration_minutes'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category.name,
        'from_price': fromPrice,
        'duration_minutes': durationMinutes,
      };
}
