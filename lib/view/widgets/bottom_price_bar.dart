import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'primary_button.dart';

/// الشريط السفلي الثابت: الإجمالي على طرف وزر المتابعة على الطرف الآخر.
/// ضعه داخل Obx إن كان السعر أو حالة الزر تتغير.
class BottomPriceBar extends StatelessWidget {
  final String priceText;
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isLoading;

  const BottomPriceBar({
    super.key,
    required this.priceText,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: darkNavy.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'total'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 12,
                    color: darkNavy.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  priceText,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: PrimaryButton(
                text: buttonText,
                onPressed: onPressed,
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}