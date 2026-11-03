import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// بطاقة الحالة العلوية: عنوان + وقت الوصول + شريط تقدّم.
class TrackingStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;

  const TrackingStatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryBlue, secondaryBlue],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 14,
              color: whiteColor.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              color: whiteColor,
              backgroundColor: whiteColor.withValues(alpha: 0.28),
            ),
          ),
        ],
      ),
    );
  }
}