import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// سطر في تفصيل السعر: اسم على طرف وقيمة على الطرف الآخر.
class PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;
  final Color? color;

  const PriceRow({
    super.key,
    required this.label,
    required this.value,
    this.bold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontFamily: cairo,
      fontSize: bold ? 16 : 14,
      fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
      color: color ?? darkNavy,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label, style: style)),
          Text(value, style: style),
        ],
      ),
    );
  }
}