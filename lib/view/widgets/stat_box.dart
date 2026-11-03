import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// مربع إحصائية صغير: أيقونة + قيمة + عنوان.
class StatBox extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatBox({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: primaryBlue, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 11.5,
              color: darkNavy.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}