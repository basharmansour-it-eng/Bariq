import 'package:bariq/controller/app/referrals_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/redeem_code_card.dart';
import '../widgets/referral_code_card.dart';
import '../widgets/referral_friend_tile.dart';
import '../widgets/referral_steps.dart';
import '../widgets/stat_box.dart';

class ReferralsView extends GetView<ReferralsController> {
  const ReferralsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile_invite'.tr)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          Obx(
            () => ReferralCodeCard(
              code: controller.code.value,
              onCopy: controller.copyCode,
              onShare: controller.shareCode,
            ),
          ),
          const SizedBox(height: 16),

          // الإحصائيات (ضغط مطوّل = محاكاة مؤقتة)
          Obx(() {
            final total = controller.friends.length;
            final earned = controller.totalEarned.toStringAsFixed(0);
            return GestureDetector(
              onLongPress: controller.simulateProgress,
              child: Row(
                children: [
                  Expanded(
                    child: StatBox(
                      icon: Icons.group_add_rounded,
                      value: '$total',
                      label: 'ref_stat_invited'.tr,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: StatBox(
                      icon: Icons.verified_rounded,
                      value: '${controller.rewardedCount}',
                      label: 'ref_stat_rewarded'.tr,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: StatBox(
                      icon: Icons.account_balance_wallet_rounded,
                      value: 'price_aed'.trParams({'price': earned}),
                      label: 'ref_stat_earned'.tr,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),

          const ReferralSteps(),
          const SizedBox(height: 16),

          Obx(
            () => RedeemCodeCard(
              controller: controller.codeController,
              redeemedCode: controller.redeemedCode.value,
              errorText: controller.redeemError.value?.tr,
              onChanged: controller.onCodeChanged,
              onRedeem: controller.redeem,
            ),
          ),
          const SizedBox(height: 22),

          Text(
            'ref_friends_title'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 12),
          Obx(() {
            final list = controller.friends.toList();

            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'ref_friends_empty'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 13.5,
                    height: 1.6,
                    color: darkNavy.withValues(alpha: 0.55),
                  ),
                ),
              );
            }

            return Column(
              children: [
                for (final f in list)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ReferralFriendTile(friend: f),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}