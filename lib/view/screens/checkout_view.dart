import 'package:bariq/controller/app/checkout_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:bariq/model/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/date_labels.dart';
import '../../model/booking_draft.dart';
import '../widgets/bottom_price_bar.dart';
import '../widgets/form_label.dart';
import '../widgets/info_row.dart';
import '../widgets/price_row.dart';
import '../widgets/selectable_tile.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  String _price(double v) =>
      'price_aed'.trParams({'price': v.toStringAsFixed(0)});

  @override
  Widget build(BuildContext context) {
    final draft = controller.draft;
    final divider = Divider(height: 14, color: lightCyan.withValues(alpha: 0.35));

    return Scaffold(
      appBar: AppBar(title: Text('checkout_title'.tr)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          // ───── ملخص الحجز ─────
          _WhiteCard(
            child: Column(
              children: [
                InfoRow(
                  icon: draft.service.icon,
                  label: 'summary_service'.tr,
                  value: draft.service.titleKey.tr,
                ),
                divider,
                InfoRow(
                  icon: draft.car.type.icon,
                  label: 'summary_car'.tr,
                  value: '${draft.car.title} • '
                      '\u2066${draft.car.plateCode} ${draft.car.plateNumber}\u2069',
                ),
                divider,
                InfoRow(
                  icon: draft.address.type.icon,
                  label: 'summary_address'.tr,
                  value: '${draft.address.emirate.labelKey.tr} • '
                      '${draft.address.area}',
                ),
                divider,
                InfoRow(
                  icon: Icons.schedule_rounded,
                  label: 'summary_time'.tr,
                  value: whenLabel(
                    draft.scheduledStart,
                    BookingDraft.windowHours,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ───── كود الخصم ─────
          FormLabel('promo_title'.tr),
          const SizedBox(height: 10),
          _PromoField(controller: controller),
          const SizedBox(height: 24),

          // ───── طريقة الدفع ─────
          FormLabel('payment_title'.tr),
          const SizedBox(height: 10),
          Obx(
            () => Column(
              children: [
                for (final method in controller.methods)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SelectableTile(
                      icon: method.icon,
                      title: method.labelKey.tr,
                      subtitle: method.hintKey?.tr,
                      selected: controller.paymentMethod.value == method,
                      onTap: () => controller.paymentMethod.value = method,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // ───── تفصيل السعر ─────
          FormLabel('price_details'.tr),
          const SizedBox(height: 10),
          Obx(
            () => _WhiteCard(
              child: Column(
                children: [
                  PriceRow(
                    label: draft.service.titleKey.tr,
                    value: _price(draft.servicePrice),
                  ),
                  for (final addOn in draft.addOns)
                    PriceRow(
                      label: addOn.titleKey.tr,
                      value: _price(addOn.price),
                    ),
                  if (controller.discount > 0)
                    PriceRow(
                      label: 'promo_discount'.tr,
                      value: 'discount_value' .trParams({
                        'price': controller.discount.toStringAsFixed(0),
                      }),
                      color: const Color(0xFF1DB954),
                    ),
                  divider,
                  PriceRow(
                    label: 'total'.tr,
                    value: _price(controller.total),
                    bold: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomPriceBar(
          priceText: _price(controller.total),
          buttonText: 'confirm_booking'.tr,
          isLoading: controller.isLoading.value,
          onPressed: controller.confirm,
        ),
      ),
    );
  }
}

class _WhiteCard extends StatelessWidget {
  final Widget child;
  const _WhiteCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class _PromoField extends StatelessWidget {
  final CheckoutController controller;
  const _PromoField({required this.controller});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1DB954);

    return Obx(() {
      final promo = controller.appliedPromo.value;

      // كود مطبّق: نعرضه مع زر إزالة
      if (promo != null) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: green, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '\u2066${promo.code}\u2069 • ${'promo_applied'.tr}',
                  style: TextStyle(
                    fontFamily: cairo,
                    fontWeight: FontWeight.w700,
                    color: darkNavy,
                  ),
                ),
              ),
              TextButton(
                onPressed: controller.removePromo,
                child: Text(
                  'promo_remove'.tr,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        );
      }

      final errorKey = controller.promoError.value;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: controller.promoController,
              textCapitalization: TextCapitalization.characters,
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.done,
              onChanged: (_) => controller.promoError.value = null,
              onSubmitted: (_) => controller.applyPromo(),
              decoration: InputDecoration(
                hintText: 'promo_hint'.tr,
                prefixIcon: const Icon(Icons.local_offer_outlined),
                errorText: errorKey?.tr,
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 96,
            height: 54,
            child: ElevatedButton(
              onPressed: controller.applyPromo,
              child: Text('promo_apply'.tr),
            ),
          ),
        ],
      );
    });
  }
}