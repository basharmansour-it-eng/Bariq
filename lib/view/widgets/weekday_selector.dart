import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// اختيار يوم من أيام الأسبوع (1 = الإثنين ... 7 = الأحد).
class WeekdaySelector extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const WeekdaySelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (var day = 1; day <= 7; day++)
          Material(
            color: day == selected ? primaryBlue : whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                color: day == selected
                    ? primaryBlue
                    : lightCyan.withValues(alpha: 0.6),
                width: 1.4,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => onChanged(day),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  'weekday_$day'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontWeight: FontWeight.w700,
                    color: day == selected ? whiteColor : darkNavy,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}