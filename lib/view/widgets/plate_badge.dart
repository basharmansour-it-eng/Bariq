import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// لوحة سيارة مبسّطة (الإمارة + الرمز + الرقم)، تُعاد في ملخص الحجز لاحقاً.
class PlateBadge extends StatelessWidget {
  final Emirate emirate;
  final String code;
  final String number;

  const PlateBadge({
    super.key,
    required this.emirate,
    required this.code,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: darkNavy, width: 1.4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emirate.labelKey.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: darkNavy,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              code.isEmpty ? number : '$code $number',
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: darkNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}