import 'package:flutter/material.dart';

/// إضافة اختيارية فوق الخدمة (معطّر، تلميع إطارات ...).
class AddOn {
  final String id;
  final String titleKey; // مفتاح ترجمة
  final double price; // بالدرهم
  final IconData icon;

  const AddOn({
    required this.id,
    required this.titleKey,
    required this.price,
    required this.icon,
  });
}

/// بيانات تجريبية؛ ستأتي لاحقاً من Firestore.
const sampleAddOns = <AddOn>[
  AddOn(
      id: 'tire_shine',
      titleKey: 'addon_tire_shine',
      price: 15,
      icon: Icons.tire_repair_rounded),
  AddOn(
      id: 'freshener',
      titleKey: 'addon_freshener',
      price: 10,
      icon: Icons.air_rounded),
  AddOn(
      id: 'pet_hair',
      titleKey: 'addon_pet_hair',
      price: 30,
      icon: Icons.pets_rounded),
  AddOn(
      id: 'leather_care',
      titleKey: 'addon_leather_care',
      price: 40,
      icon: Icons.airline_seat_recline_extra_rounded),
  AddOn(
      id: 'engine_bay',
      titleKey: 'addon_engine_bay',
      price: 50,
      icon: Icons.engineering_rounded),
];