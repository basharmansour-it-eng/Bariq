import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/date_labels.dart';
import '../../model/booking_draft.dart';
import '../../model/order_model.dart';
import 'status_chip.dart';

/// بطاقة طلب في قائمة طلباتي.
class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const OrderCard({
    super.key,
    required this.order,
    required this.onTap,
    this.onLongPress,
  });

  /// الموعد: المجدول، أو «في أقرب وقت» للطلب الجاري، أو تاريخ الطلب للسابق
String get _timeText => orderTimeLabel(
      scheduledStart: order.scheduledStart,
      createdAt: order.createdAt,
      isActive: order.status.isActive,
      windowHours: BookingDraft.windowHours,
    );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: lightCyan.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(order.category.icon,
                        color: primaryBlue, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceTitleKey.tr,
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: darkNavy,
                          ),
                        ),
                        Text(
                          '\u2066${order.id}\u2069',
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 12,
                            color: darkNavy.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusChip(status: order.status),
                ],
              ),
              Divider(height: 24, color: lightCyan.withValues(alpha: 0.35)),
              _Line(
                icon: order.car.type.icon,
                text: '${order.car.title} • '
                    '\u2066${order.car.plateCode} ${order.car.plateNumber}\u2069',
              ),
              _Line(
                icon: order.address.type.icon,
                text: '${order.address.emirate.labelKey.tr} • '
                    '${order.address.area}',
              ),
              _Line(icon: Icons.schedule_rounded, text: _timeText),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'total'.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 12,
                      color: darkNavy.withValues(alpha: 0.55),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'price_aed'
                        .trParams({'price': order.total.toStringAsFixed(0)}),
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: primaryBlue,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right_rounded,
                      color: darkNavy.withValues(alpha: 0.35)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Line({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 16, color: darkNavy.withValues(alpha: 0.45)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 13,
                color: darkNavy.withValues(alpha: 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}