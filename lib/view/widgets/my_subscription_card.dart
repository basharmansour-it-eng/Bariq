import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/date_labels.dart';
import '../../model/booking_draft.dart';
import '../../model/subscription_model.dart';
import '../../model/wash_service_model.dart';
import 'icon_line.dart';

/// بطاقة اشتراك المستخدم مع قائمة إدارة (تبديل التجديد / الإلغاء).
class MySubscriptionCard extends StatelessWidget {
  final SubscriptionModel subscription;
  final VoidCallback onToggleRenewal;
  final VoidCallback onCancel;
  final VoidCallback? onLongPress;

  const MySubscriptionCard({
    super.key,
    required this.subscription,
    required this.onToggleRenewal,
    required this.onCancel,
    this.onLongPress,
  });

  bool get _isActive => subscription.status == SubscriptionStatus.active;
  bool get _isAuto => subscription.renewalMode == RenewalMode.auto;

  String get _renewalText {
    if (!_isActive) return 'subs_cancelled_note'.tr;
    final date = dateLabel(subscription.renewalDate);
    return _isAuto
        ? 'subs_renews_auto'.trParams({'date': date})
        : 'subs_renews_manual'.trParams({'date': date});
  }

  @override
  Widget build(BuildContext context) {
    final s = subscription;
    final used = s.washesUsed.clamp(0, s.washesPerMonth);
    final progress = s.washesPerMonth == 0 ? 0.0 : used / s.washesPerMonth;
    final time = slotLabel(
      DateTime(2000, 1, 1, s.preferredHour),
      BookingDraft.windowHours,
    );

    return Opacity(
      opacity: _isActive ? 1 : 0.7,
      child: Material(
        color: whiteColor,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onLongPress: onLongPress,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [primaryBlue, secondaryBlue],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(s.category.icon,
                            color: whiteColor, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s.titleKey.tr,
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: darkNavy,
                              ),
                            ),
                            Text(
                              'plan_washes'.trParams(
                                  {'count': s.washesPerMonth.toString()}),
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 12,
                                color: darkNavy.withValues(alpha: 0.55),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _StatusPill(isActive: _isActive),
                      if (_isActive)
                        PopupMenuButton<String>(
                          icon: Icon(Icons.more_vert_rounded,
                              color: darkNavy.withValues(alpha: 0.5)),
                          color: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          onSelected: (v) {
                            if (v == 'renewal') onToggleRenewal();
                            if (v == 'cancel') onCancel();
                          },
                          itemBuilder: (_) => [
                            PopupMenuItem(
                              value: 'renewal',
                              child: Text(
                                _isAuto
                                    ? 'subs_switch_to_manual'.tr
                                    : 'subs_switch_to_auto'.tr,
                              ),
                            ),
                            PopupMenuItem(
                              value: 'cancel',
                              child: Text(
                                'subs_cancel'.tr,
                                style:
                                    const TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        )
                      else
                        const SizedBox(width: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // التقدّم
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'subs_washes_left'.trParams({
                          'left': s.washesRemaining.toString(),
                          'total': s.washesPerMonth.toString(),
                        }),
                        style: TextStyle(
                          fontFamily: cairo,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: darkNavy,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          color: primaryBlue,
                          backgroundColor: lightCyan.withValues(alpha: 0.35),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 24, color: lightCyan.withValues(alpha: 0.35)),

                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Column(
                    children: [
                      IconLine(
                        icon: s.car.type.icon,
                        text: '${s.car.title} • '
                            '\u2066${s.car.plateCode} ${s.car.plateNumber}\u2069',
                      ),
                      IconLine(
                        icon: s.address.type.icon,
                        text: '${s.address.emirate.labelKey.tr} • '
                            '${s.address.area}',
                      ),
                      IconLine(
                        icon: Icons.event_repeat_rounded,
                        text: 'subs_schedule'.trParams({
                          'day': 'weekday_${s.preferredWeekday}'.tr,
                          'time': time,
                        }),
                      ),
                      IconLine(
                        icon: _isAuto
                            ? Icons.autorenew_rounded
                            : Icons.notifications_active_rounded,
                        text: _renewalText,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'price_aed'.trParams({
                              'price': s.monthlyPrice.toStringAsFixed(0)
                            }),
                            style: TextStyle(
                              fontFamily: cairo,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: primaryBlue,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'plan_per_month'.tr,
                            style: TextStyle(
                              fontFamily: cairo,
                              fontSize: 12,
                              color: darkNavy.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final bool isActive;
  const _StatusPill({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF1DB954) : Colors.redAccent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'subs_status_active'.tr : 'subs_status_cancelled'.tr,
        style: TextStyle(
          fontFamily: cairo,
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}