import 'package:flutter/material.dart';

import 'emirate.dart';

enum CarType { sedan, suv, hatchback, coupe, pickup }

extension CarTypeX on CarType {
  /// مفتاح الترجمة: car_type_sedan ...
  String get labelKey => 'car_type_$name';

  IconData get icon {
    switch (this) {
      case CarType.sedan:
        return Icons.directions_car_filled_rounded;
      case CarType.suv:
        return Icons.airport_shuttle_rounded;
      case CarType.hatchback:
        return Icons.directions_car_rounded;
      case CarType.coupe:
        return Icons.time_to_leave_rounded;
      case CarType.pickup:
        return Icons.local_shipping_rounded;
    }
  }
}

class CarModel {
  final String id;
  final String brand;
  final String model;
  final CarType type;
  final int colorValue;
  final Emirate plateEmirate;
  final String plateCode;
  final String plateNumber;
  final bool isDefault;

  const CarModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.type,
    required this.colorValue,
    required this.plateEmirate,
    required this.plateCode,
    required this.plateNumber,
    this.isDefault = false,
  });

  Color get color => Color(colorValue);

  String get title => '$brand $model';

  CarModel copyWith({String? id, bool? isDefault}) => CarModel(
        id: id ?? this.id,
        brand: brand,
        model: model,
        type: type,
        colorValue: colorValue,
        plateEmirate: plateEmirate,
        plateCode: plateCode,
        plateNumber: plateNumber,
        isDefault: isDefault ?? this.isDefault,
      );

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json['id'].toString(),
        brand: json['brand'] as String,
        model: json['model'] as String,
        type: CarType.values.byName(json['type'] as String),
        colorValue: json['color'] as int,
        plateEmirate: Emirate.values.byName(json['plate_emirate'] as String),
        plateCode: json['plate_code'] as String,
        plateNumber: json['plate_number'] as String,
        isDefault: json['is_default'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'model': model,
        'type': type.name,
        'color': colorValue,
        'plate_emirate': plateEmirate.name,
        'plate_code': plateCode,
        'plate_number': plateNumber,
        'is_default': isDefault,
      };
}