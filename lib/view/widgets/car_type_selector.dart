import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/car_model.dart';

/// اختيار نوع السيارة (سيدان، دفع رباعي، ...).
class CarTypeSelector extends StatelessWidget {
  final CarType selected;
  final ValueChanged<CarType> onChanged;

  const CarTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: CarType.values.map((t) {
        final isSelected = t == selected;
        return Material(
          color: isSelected ? primaryBlue : whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: isSelected
                  ? primaryBlue
                  : lightCyan.withValues(alpha: 0.6),
              width: 1.4,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => onChanged(t),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    t.icon,
                    size: 20,
                    color: isSelected ? whiteColor : primaryBlue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    t.labelKey.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? whiteColor : darkNavy,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}