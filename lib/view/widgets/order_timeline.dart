import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/order_model.dart';

/// مخطط زمني عمودي لمراحل الطلب (لا يُستخدم للطلب الملغي).
class OrderTimeline extends StatelessWidget {
  final OrderStatus status;

  const OrderTimeline({super.key, required this.status});

  static const _steps = [
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.onTheWay,
    OrderStatus.inProgress,
    OrderStatus.completed,
  ];

  @override
  Widget build(BuildContext context) {
    final current = _steps.indexOf(status);
    final allDone = status == OrderStatus.completed;

    return Column(
      children: [
        for (var i = 0; i < _steps.length; i++)
          _TimelineStep(
            label: _steps[i].labelKey.tr,
            isDone: allDone || i < current,
            isCurrent: !allDone && i == current,
            isLast: i == _steps.length - 1,
          ),
      ],
    );
  }
}

class _TimelineStep extends StatelessWidget {
  final String label;
  final bool isDone;
  final bool isCurrent;
  final bool isLast;

  const _TimelineStep({
    required this.label,
    required this.isDone,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final inactive = darkNavy.withValues(alpha: 0.2);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              _Dot(isDone: isDone, isCurrent: isCurrent, inactive: inactive),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    color: isDone ? primaryBlue : inactive,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                  color: (isDone || isCurrent)
                      ? darkNavy
                      : darkNavy.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isDone;
  final bool isCurrent;
  final Color inactive;

  const _Dot({
    required this.isDone,
    required this.isCurrent,
    required this.inactive,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Container(
        width: 22,
        height: 22,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlue,
        ),
        child: const Icon(Icons.check_rounded, size: 14, color: whiteColor),
      );
    }

    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isCurrent ? primaryBlue : inactive,
          width: isCurrent ? 2.4 : 1.6,
        ),
      ),
      child: isCurrent
          ? Center(
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryBlue,
                ),
              ),
            )
          : null,
    );
  }
}