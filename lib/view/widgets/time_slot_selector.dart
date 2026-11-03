import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// شبكة فترات زمنية (مثل 08:00 - 10:00)، المتاح منها فقط قابل للضغط.
class TimeSlotSelector extends StatelessWidget {
  final List<int> startHours;
  final int? selected;
  final bool Function(int hour) isAvailable;
  final ValueChanged<int> onChanged;
  final int windowHours;

  const TimeSlotSelector({
    super.key,
    required this.startHours,
    required this.selected,
    required this.isAvailable,
    required this.onChanged,
    this.windowHours = 2,
  });

  String _t(int h) => '${h.toString().padLeft(2, '0')}:00';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: startHours.map((h) {
        final enabled = isAvailable(h);
        final isSelected = h == selected;

        return Opacity(
          opacity: enabled ? 1 : 0.4,
          child: Material(
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
              onTap: enabled ? () => onChanged(h) : null,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                // \u2066 ... \u2069 تعزل الاتجاه حتى لا تنعكس الأرقام في الواجهة العربية
                child: Text(
                  '\u2066${_t(h)} - ${_t(h + windowHours)}\u2069',
                  style: TextStyle(
                    fontFamily: cairo,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? whiteColor : darkNavy,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}