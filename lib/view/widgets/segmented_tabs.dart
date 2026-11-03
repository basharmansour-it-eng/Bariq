import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// تبويبات مقسّمة (مثل: الحالية | السابقة) بدون TabController.
class SegmentedTabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SegmentedTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            Expanded(
              child: Material(
                color: i == selectedIndex ? primaryBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => onChanged(i),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: Center(
                      child: Text(
                        labels[i],
                        style: TextStyle(
                          fontFamily: cairo,
                          fontWeight: FontWeight.w700,
                          color: i == selectedIndex ? whiteColor : darkNavy,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}