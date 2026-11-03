import 'package:bariq/controller/app/booking_controller.dart';
import 'package:bariq/controller/app/plan_details_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/date_labels.dart';
import '../../model/subscription_model.dart';
import '../../model/subscription_plan_model.dart';
import '../../model/wash_service_model.dart';
import '../widgets/address_picker.dart';
import '../widgets/app_card.dart';
import '../widgets/bottom_price_bar.dart';
import '../widgets/car_picker.dart';
import '../widgets/form_label.dart';
import '../widgets/includes_card.dart';
import '../widgets/price_row.dart';
import '../widgets/selectable_tile.dart';
import '../widgets/time_slot_selector.dart';
import '../widgets/weekday_selector.dart';

class PlanDetailsView extends GetView<PlanDetailsController> {
  const PlanDetailsView({super.key});

  String _price(double v) =>
      'price_aed'.trParams({'price': v.toStringAsFixed(0)});

  @override
  Widget build(BuildContext context) {
    final divider =
        Divider(height: 14, color: lightCyan.withValues(alpha: 0.35));

    return Scaffold(
      appBar: AppBar(title: Text('plan_details_title'.tr)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          _PlanHeader(plan: controller.plan),
          const SizedBox(height: 24),

          FormLabel('plan_includes'.tr),
          const SizedBox(height: 10),
          IncludesCard(keys: controller.service.includesKeys),
          const SizedBox(height: 24),

          // السيارة والعنوان
          Obx(
            () => CarPicker(
              cars: controller.cars.toList(),
              selectedId: controller.selectedCarId.value,
              onSelect: (id) => controller.selectedCarId.value = id,
            ),
          ),
          const SizedBox(height: 14),
          Obx(
            () => AddressPicker(
              addresses: controller.addresses.toList(),
              selectedId: controller.selectedAddressId.value,
              onSelect: (id) => controller.selectedAddressId.value = id,
            ),
          ),
          const SizedBox(height: 14),

          // اليوم والفترة المفضلان
          FormLabel('plan_weekday'.tr),
          const SizedBox(height: 10),
          Obx(
            () => WeekdaySelector(
              selected: controller.preferredWeekday.value,
              onChanged: (d) => controller.preferredWeekday.value = d,
            ),
          ),
          const SizedBox(height: 24),
          FormLabel('plan_time'.tr),
          const SizedBox(height: 10),
          Obx(
            () => TimeSlotSelector(
              startHours: BookingController.slotHours,
              selected: controller.preferredHour.value,
              isAvailable: (_) => true,
              onChanged: (h) => controller.preferredHour.value = h,
            ),
          ),
          const SizedBox(height: 24),

          // طريقة التجديد
          FormLabel('plan_renewal'.tr),
          const SizedBox(height: 10),
          Obx(
            () => Column(
              children: [
                SelectableTile(
                  icon: Icons.autorenew_rounded,
                  title: 'renewal_auto'.tr,
                  subtitle: 'renewal_auto_hint'.tr,
                  selected: controller.renewalMode.value == RenewalMode.auto,
                  onTap: () => controller.setRenewalMode(RenewalMode.auto),
                ),
                const SizedBox(height: 10),
                SelectableTile(
                  icon: Icons.notifications_active_rounded,
                  title: 'renewal_manual'.tr,
                  subtitle: 'renewal_manual_hint'.tr,
                  selected: controller.renewalMode.value == RenewalMode.manual,
                  onTap: () => controller.setRenewalMode(RenewalMode.manual),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // طريقة الدفع
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

          // الملخص
          FormLabel('plan_summary'.tr),
          const SizedBox(height: 10),
          Obx(
            () => AppCard(
              child: Column(
                children: [
                  PriceRow(
                    label: 'plan_regular_price'.tr,
                    value: _price(controller.regularPrice),
                  ),
                  PriceRow(
                    label: 'plan_discount_line'.trParams({
                      'percent':
                          controller.plan.discountPercent.toStringAsFixed(0),
                    }),
                    value: 'discount_value'.trParams(
                        {'price': controller.saving.toStringAsFixed(0)}),
                    color: const Color(0xFF1DB954),
                  ),
                  divider,
                  PriceRow(
                    label: 'plan_monthly_total'.tr,
                    value: _price(controller.monthlyPrice),
                    bold: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Obx(() {
            final isAuto = controller.renewalMode.value == RenewalMode.auto;
            final date = dateLabel(controller.renewalDate);
            return Text(
              isAuto
                  ? 'renewal_auto_note'.trParams({
                      'price': _price(controller.monthlyPrice),
                      'date': date,
                    })
                  : 'renewal_manual_note'.trParams({'date': date}),
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 12,
                height: 1.6,
                color: darkNavy.withValues(alpha: 0.6),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomPriceBar(
          priceText: _price(controller.monthlyPrice),
          buttonText: 'subscribe_now'.tr,
          isLoading: controller.isLoading.value,
          onPressed: controller.canSubscribe ? controller.subscribe : null,
        ),
      ),
    );
  }
}

class _PlanHeader extends StatelessWidget {
  final SubscriptionPlan plan;
  const _PlanHeader({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryBlue, secondaryBlue],
        ),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whiteColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(plan.category.icon, color: whiteColor, size: 30),
          ),
          const SizedBox(height: 14),
          Text(
            plan.titleKey.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${'plan_washes'.trParams({'count': plan.washesPerMonth.toString()})}'
            ' • ${'plan_save'.trParams({'percent': plan.discountPercent.toStringAsFixed(0)})}',
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: whiteColor.withValues(alpha: 0.95),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            plan.descKey.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 13,
              height: 1.7,
              color: whiteColor.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}