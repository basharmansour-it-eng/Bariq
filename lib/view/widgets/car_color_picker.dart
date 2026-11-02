import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';

import '../../core/constant/car_colors.dart';

/// صف دوائر ألوان لاختيار لون السيارة.
class CarColorPicker extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const CarColorPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: carColorValues.map((value) {
        final color = Color(value);
        final isSelected = value == selected;
        return GestureDetector(
          onTap: () => onChanged(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? primaryBlue
                    : darkNavy.withValues(alpha: 0.2),
                width: isSelected ? 3 : 1.2,
              ),
            ),
            child: isSelected
                ? Icon(
                    Icons.check_rounded,
                    size: 20,
                    color: color.computeLuminance() > 0.6
                        ? darkNavy
                        : whiteColor,
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }
}