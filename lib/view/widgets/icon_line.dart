import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// سطر صغير: أيقونة رمادية + نص (سيارة، عنوان، موعد ...).
class IconLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconLine({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 16, color: darkNavy.withValues(alpha: 0.45)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 13,
                color: darkNavy.withValues(alpha: 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}