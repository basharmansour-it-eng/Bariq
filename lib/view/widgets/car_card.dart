import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/car_model.dart';
import 'plate_badge.dart';

/// بطاقة سيارة واحدة في قائمة سياراتي.
class CarCard extends StatelessWidget {
  final CarModel car;
  final VoidCallback onSetDefault;
  final VoidCallback onDelete;

  const CarCard({
    super.key,
    required this.car,
    required this.onSetDefault,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: car.isDefault
            ? Border.all(color: primaryBlue.withValues(alpha: 0.5), width: 1.4)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: lightCyan.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(car.type.icon, color: primaryBlue, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
                const SizedBox(height: 6),
                PlateBadge(
                  emirate: car.plateEmirate,
                  code: car.plateCode,
                  number: car.plateNumber,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // نقطة اللون + نوع السيارة
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: car.color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: darkNavy.withValues(alpha: 0.25),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          car.type.labelKey.tr,
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 12,
                            color: darkNavy.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                    if (car.isDefault)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: primaryBlue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'car_default'.tr,
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: primaryBlue,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert_rounded,
                color: darkNavy.withValues(alpha: 0.5)),
            color: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            onSelected: (value) {
              if (value == 'default') onSetDefault();
              if (value == 'delete') onDelete();
            },
            itemBuilder: (_) => [
              if (!car.isDefault)
                PopupMenuItem(
                  value: 'default',
                  child: Text('set_default'.tr),
                ),
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  'delete'.tr,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}