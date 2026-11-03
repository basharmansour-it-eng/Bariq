import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// شريط أفقي لاختيار اليوم (اليوم، غداً، ثم أسماء الأيام).
class DaySelector extends StatelessWidget {
  final List<DateTime> days;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const DaySelector({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onChanged,
  });

  String _label(DateTime d) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final diff = DateTime(d.year, d.month, d.day).difference(today).inDays;
    if (diff == 0) return 'today'.tr;
    if (diff == 1) return 'tomorrow'.tr;
    return 'weekday_${d.weekday}'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final isSelected = i == selectedIndex;
          return Material(
            color: isSelected ? primaryBlue : whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: isSelected
                    ? primaryBlue
                    : lightCyan.withValues(alpha: 0.6),
                width: 1.4,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onChanged(i),
              child: SizedBox(
                width: 76,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _label(days[i]),
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? whiteColor.withValues(alpha: 0.9)
                            : darkNavy.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${days[i].day}',
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isSelected ? whiteColor : darkNavy,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}