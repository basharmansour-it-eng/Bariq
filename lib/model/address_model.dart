import 'package:flutter/material.dart';

import 'emirate.dart';

enum AddressType { home, work, other }

extension AddressTypeX on AddressType {
  /// مفتاح الترجمة: address_type_home ...
  String get labelKey => 'address_type_$name';

  IconData get icon {
    switch (this) {
      case AddressType.home:
        return Icons.home_rounded;
      case AddressType.work:
        return Icons.work_rounded;
      case AddressType.other:
        return Icons.place_rounded;
    }
  }
}

class AddressModel {
  final String id;
  final AddressType type;
  final Emirate emirate;
  final String area; // المنطقة: مثل Dubai Marina
  final String building; // اسم المبنى أو الفيلا
  final String details; // الشقة / الطابق / رقم الموقف
  final double? lat; // تُملأ لاحقاً من الخريطة
  final double? lng;
  final bool isDefault;

  const AddressModel({
    required this.id,
    required this.type,
    required this.emirate,
    required this.area,
    required this.building,
    required this.details,
    this.lat,
    this.lng,
    this.isDefault = false,
  });

  /// المبنى + التفاصيل في سطر واحد (يتجاهل الفارغ منهما)
  String get fullDetails => [building, details]
      .where((s) => s.trim().isNotEmpty)
      .join(' • ');

  AddressModel copyWith({String? id, bool? isDefault}) => AddressModel(
        id: id ?? this.id,
        type: type,
        emirate: emirate,
        area: area,
        building: building,
        details: details,
        lat: lat,
        lng: lng,
        isDefault: isDefault ?? this.isDefault,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'].toString(),
        type: AddressType.values.byName(json['type'] as String),
        emirate: Emirate.values.byName(json['emirate'] as String),
        area: json['area'] as String,
        building: json['building'] as String,
        details: json['details'] as String,
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
        isDefault: json['is_default'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'emirate': emirate.name,
        'area': area,
        'building': building,
        'details': details,
        'lat': lat,
        'lng': lng,
        'is_default': isDefault,
      };
}