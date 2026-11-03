import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/subscription_plan_model.dart';
import '../../model/wash_service_model.dart';

/// بطاقة باقة اشتراك شهري. unitPrice = سعر الغسلة الواحدة (أقل سعر للخدمة).
class SubscriptionCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final double unitPrice;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.plan,
    required this.unitPrice,
    required this.onTap,
  });

  String _price(double v) =>
      'price_aed'.trParams({'price': v.toStringAsFixed(0)});

  @override
  Widget build(BuildContext context) {
    final discounted = plan.discountedPrice(unitPrice);
    final regular = plan.regularPrice(unitPrice);

    return Material(
      color: whiteColor,
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                plan.isPopular ? 32 : 16,
                16,
                16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [primaryBlue, secondaryBlue],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          plan.category.icon,
                          color: whiteColor,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plan.titleKey.tr,
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: darkNavy,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              plan.descKey.tr,
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 12,
                                height: 1.5,
                                color: darkNavy.withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _FeatureChip(
                        icon: Icons.event_repeat_rounded,
                        text: 'plan_washes'.trParams({
                          'count': plan.washesPerMonth.toString(),
                        }),
                      ),
                      _FeatureChip(
                        icon: Icons.savings_rounded,
                        text: 'plan_save'.trParams({
                          'percent': plan.discountPercent.toStringAsFixed(0),
                        }),
                      ),
                      if (plan.isWaterless)
                        _FeatureChip(
                          icon: Icons.eco_rounded,
                          text: 'eco_badge'.tr,
                          color: const Color(0xFF1DB954),
                        ),
                    ],
                  ),
                  Divider(height: 28, color: lightCyan.withValues(alpha: 0.35)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'plan_from'.tr,
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 11,
                                color: darkNavy.withValues(alpha: 0.55),
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.end,
                              spacing: 6,
                              children: [
                                Text(
                                  _price(discounted),
                                  style: TextStyle(
                                    fontFamily: cairo,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: primaryBlue,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    'plan_per_month'.tr,
                                    style: TextStyle(
                                      fontFamily: cairo,
                                      fontSize: 12,
                                      color: darkNavy.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    _price(regular),
                                    style: TextStyle(
                                      fontFamily: cairo,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      color: darkNavy.withValues(alpha: 0.4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 108,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: onTap,
                          child: Text('plan_subscribe'.tr),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (plan.isPopular)
              PositionedDirectional(
                top: 0,
                end: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: const BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'plan_popular'.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _FeatureChip({
    required this.icon,
    required this.text,
    this.color = primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
