import 'package:bariq/controller/app/order_details_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:bariq/model/payment_method.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:bariq/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../widgets/before_after_slider.dart';
import '../widgets/order_photo.dart';
import '../widgets/rating_card.dart';

import '../../core/functions/date_labels.dart';
import '../../model/booking_draft.dart';
import '../../model/order_model.dart';
import '../widgets/app_card.dart';
import '../widgets/form_label.dart';
import '../widgets/info_row.dart';
import '../widgets/order_timeline.dart';
import '../widgets/price_row.dart';
import '../widgets/status_chip.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

  String _price(double v) =>
      'price_aed'.trParams({'price': v.toStringAsFixed(0)});

  String _placedAt(DateTime d) {
    final time =
        '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
    return '\u2066${d.day}/${d.month}/${d.year} $time\u2069';
  }

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      height: 14,
      color: lightCyan.withValues(alpha: 0.35),
    );

    return Scaffold(
      appBar: AppBar(title: Text('order_details_title'.tr)),
      body: Obx(() {
        final order = controller.order;
        if (order == null) return const SizedBox.shrink();
        final pairs = math.min(
          order.beforePhotos.length,
          order.afterPhotos.length,
        );

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            // ───── الرأس ─────
            AppCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2066${order.id}\u2069',
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: darkNavy,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'order_placed_at'.trParams({
                            'date': _placedAt(order.createdAt),
                          }),
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 12,
                            color: darkNavy.withValues(alpha: 0.55),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusChip(status: order.status),
                ],
              ),
            ),

            if (order.status == OrderStatus.onTheWay ||
                order.status == OrderStatus.inProgress) ...[
              const SizedBox(height: 14),
              PrimaryButton(
                text: 'track_button'.tr,
                onPressed: controller.openTracking,
              ),
            ],

            const SizedBox(height: 24),

            // ───── التقدّم ─────
            if (order.status == OrderStatus.cancelled)
              const _CancelledBanner()
            else ...[
              FormLabel('order_progress'.tr),
              const SizedBox(height: 10),
              GestureDetector(
                onLongPress: controller.addSamplePhotos, // مؤقت
                child: AppCard(child: OrderTimeline(status: order.status)),
              ),
            ],
            const SizedBox(height: 24),

            // ───── صور قبل / بعد ─────
            if (order.status == OrderStatus.completed && pairs > 0) ...[
              FormLabel('order_photos'.tr),
              const SizedBox(height: 4),
              Text(
                'order_photos_hint'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 12,
                  color: darkNavy.withValues(alpha: 0.55),
                ),
              ),
              const SizedBox(height: 12),
              for (var i = 0; i < pairs; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: i == pairs - 1 ? 0 : 12),
                  child: BeforeAfterSlider(
                    before: OrderPhoto(
                      source: order.beforePhotos[i],
                      isAfter: false,
                    ),
                    after: OrderPhoto(
                      source: order.afterPhotos[i],
                      isAfter: true,
                    ),
                  ),
                ),
              const SizedBox(height: 24),
            ],

            // ───── التقييم ─────
            if (order.status == OrderStatus.completed) ...[
              FormLabel('rate_section'.tr),
              const SizedBox(height: 10),
              Obx(
                () => RatingCard(
                  rating: order.rating,
                  review: order.review,
                  draftRating: controller.draftRating.value,
                  onRatingChanged: controller.setDraftRating,
                  commentController: controller.commentController,
                  isSubmitting: controller.isSubmittingRating.value,
                  onSubmit: controller.submitRating,
                ),
              ),
              const SizedBox(height: 24),
            ],

            // ───── معلومات الطلب ─────
            FormLabel('order_info'.tr),
            const SizedBox(height: 10),
            AppCard(
              child: Column(
                children: [
                  InfoRow(
                    icon: order.category.icon,
                    label: 'summary_service'.tr,
                    value: order.serviceTitleKey.tr,
                  ),
                  divider,
                  InfoRow(
                    icon: order.car.type.icon,
                    label: 'summary_car'.tr,
                    value:
                        '${order.car.title} • '
                        '\u2066${order.car.plateCode} ${order.car.plateNumber}\u2069',
                  ),
                  divider,
                  InfoRow(
                    icon: order.address.type.icon,
                    label: 'summary_address'.tr,
                    value:
                        '${order.address.emirate.labelKey.tr} • '
                        '${order.address.area}'
                        '${order.address.fullDetails.isEmpty ? '' : '\n${order.address.fullDetails}'}',
                  ),
                  divider,
                  InfoRow(
                    icon: Icons.schedule_rounded,
                    label: 'summary_time'.tr,
                    value: orderTimeLabel(
                      scheduledStart: order.scheduledStart,
                      createdAt: order.createdAt,
                      isActive: order.status.isActive,
                      windowHours: BookingDraft.windowHours,
                    ),
                  ),
                  divider,
                  InfoRow(
                    icon: order.paymentMethod.icon,
                    label: 'summary_payment'.tr,
                    value: order.paymentMethod.labelKey.tr,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ───── تفصيل السعر ─────
            FormLabel('price_details'.tr),
            const SizedBox(height: 10),
            AppCard(
              child: Column(
                children: [
                  PriceRow(
                    label: order.serviceTitleKey.tr,
                    value: _price(order.servicePrice),
                  ),
                  for (final addOn in order.addOns)
                    PriceRow(
                      label: addOn.titleKey.tr,
                      value: _price(addOn.price),
                    ),
                  if (order.discount > 0)
                    PriceRow(
                      label: 'promo_discount'.tr,
                      value: 'discount_value'.trParams({
                        'price': order.discount.toStringAsFixed(0),
                      }),
                      color: const Color(0xFF1DB954),
                    ),
                  divider,
                  PriceRow(
                    label: 'total'.tr,
                    value: _price(order.total),
                    bold: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // ───── الإلغاء ─────
            if (controller.canCancel)
              Obx(
                () => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent, width: 1.4),
                  ),
                  onPressed: controller.isCancelling.value
                      ? null
                      : controller.cancel,
                  child: controller.isCancelling.value
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: Colors.redAccent,
                          ),
                        )
                      : Text('cancel_order'.tr),
                ),
              )
            else if (order.status == OrderStatus.onTheWay ||
                order.status == OrderStatus.inProgress)
              Text(
                'cancel_not_allowed'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 12,
                  height: 1.6,
                  color: darkNavy.withValues(alpha: 0.55),
                ),
              ),
          ],
        );
      }),
    );
  }
}

class _CancelledBanner extends StatelessWidget {
  const _CancelledBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.redAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.cancel_rounded, color: Colors.redAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'order_cancelled_banner'.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontWeight: FontWeight.w700,
                color: darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
