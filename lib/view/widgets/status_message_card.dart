import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';

import 'app_card.dart';

/// رسالة حالة بأيقونة (جاري الغسيل، لم ينطلق الفني، التتبع غير متاح ...).
class StatusMessageCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const StatusMessageCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightCyan.withValues(alpha: 0.3),
            ),
            child: Icon(icon, size: 36, color: primaryBlue),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 13,
              height: 1.6,
              color: darkNavy.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}