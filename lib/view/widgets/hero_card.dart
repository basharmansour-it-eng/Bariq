import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// البطاقة الرئيسية في أعلى الشاشة الرئيسية (احجز الآن / جدولة).
class HeroCard extends StatelessWidget {
  final VoidCallback onBookNow;
  final VoidCallback onSchedule;

  const HeroCard({
    super.key,
    required this.onBookNow,
    required this.onSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryBlue, secondaryBlue],
        ),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              mainImage,
              height: context.screenHeight * 0.16,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'tagline'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor,
                    foregroundColor: primaryBlue,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: onBookNow,
                  child: Text('book_now'.tr),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: whiteColor,
                    side: const BorderSide(color: whiteColor, width: 1.3),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: onSchedule,
                  child: Text('schedule'.tr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
