import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/referral_config.dart';

/// شرح "كيف تعمل؟" بثلاث خطوات.
class ReferralSteps extends StatelessWidget {
  const ReferralSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final friend = ReferralConfig.friendDiscount.toStringAsFixed(0);
    final reward = ReferralConfig.referrerReward.toStringAsFixed(0);

    final steps = [
      'ref_step1'.tr,
      'ref_step2'.trParams({'amount': friend}),
      'ref_step3'.trParams({'amount': reward}),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ref_how_title'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < steps.length; i++)
            Padding(
              padding: EdgeInsets.only(bottom: i == steps.length - 1 ? 0 : 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightCyan.withValues(alpha: 0.35),
                    ),
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        steps[i],
                        style: TextStyle(
                          fontFamily: cairo,
                          fontSize: 13.5,
                          height: 1.5,
                          color: darkNavy.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}