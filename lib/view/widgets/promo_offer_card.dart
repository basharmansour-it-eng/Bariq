import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/promo_code_model.dart';

/// بطاقة عرض بكود خصم قابل للنسخ بضغطة.
class PromoOfferCard extends StatelessWidget {
  final PromoCode promo;
  final VoidCallback onCopy;

  const PromoOfferCard({super.key, required this.promo, required this.onCopy});

  String get _title => promo.percent > 0
      ? 'promo_percent_off'
          .trParams({'value': promo.percent.toStringAsFixed(0)})
      : 'promo_fixed_off'.trParams({'value': promo.fixed.toStringAsFixed(0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: lightCyan.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.local_offer_rounded,
                color: primaryBlue, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'promo_offer_desc'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 12,
                    color: darkNavy.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onCopy,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: primaryBlue.withValues(alpha: 0.5),
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\u2066${promo.code}\u2069',
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      color: primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.copy_rounded,
                      size: 15, color: primaryBlue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}