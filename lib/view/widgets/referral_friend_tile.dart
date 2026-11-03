import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/referral_config.dart';
import '../../core/functions/date_labels.dart';
import '../../model/referral_model.dart';

/// سطر صديق في قائمة الإحالات.
class ReferralFriendTile extends StatelessWidget {
  final ReferralFriend friend;
  const ReferralFriendTile({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    final rewarded = friend.status == ReferralStatus.rewarded;
    final color = rewarded ? const Color(0xFF1DB954) : Colors.orange;
    final name = friend.name.trim();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 21,
            backgroundColor: lightCyan.withValues(alpha: 0.35),
            child: Text(
              name.isEmpty ? '?' : name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                fontFamily: cairo,
                fontWeight: FontWeight.w800,
                color: primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: darkNavy,
                  ),
                ),
                Text(
                  dateLabel(friend.joinedAt),
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 12,
                    color: darkNavy.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  rewarded
                      ? 'ref_status_rewarded'.tr
                      : 'ref_status_pending'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
              if (rewarded) ...[
                const SizedBox(height: 4),
                Text(
                  'ref_reward_plus'.trParams({
                    'amount':
                        ReferralConfig.referrerReward.toStringAsFixed(0),
                  }),
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: primaryBlue,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}