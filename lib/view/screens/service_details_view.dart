import 'package:bariq/controller/app/service_details_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/view/widgets/bottom_price_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/wash_service_model.dart';
import '../widgets/addon_tile.dart';
import '../widgets/car_type_selector.dart';
import '../widgets/form_label.dart';

class ServiceDetailsView extends GetView<ServiceDetailsController> {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final service = controller.service;

    return Scaffold(
      appBar: AppBar(title: Text(service.titleKey.tr)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          _Header(service: service),
          const SizedBox(height: 24),

          FormLabel('service_details_includes'.tr),
          const SizedBox(height: 10),
          _IncludesCard(keys: service.includesKeys),
          const SizedBox(height: 24),

          FormLabel('service_choose_car_type'.tr),
          const SizedBox(height: 10),
          Obx(
            () => CarTypeSelector(
              selected: controller.carType.value,
              onChanged: (t) => controller.carType.value = t,
            ),
          ),
          const SizedBox(height: 12),
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: primaryBlue.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'service_car_price'.tr,
                      style: TextStyle(
                        fontFamily: cairo,
                        fontWeight: FontWeight.w600,
                        color: darkNavy,
                      ),
                    ),
                  ),
                  Text(
                    'price_aed'.trParams(
                        {'price': controller.servicePrice.toStringAsFixed(0)}),
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          FormLabel('service_addons'.tr),
          const SizedBox(height: 10),
          for (final addOn in controller.addOns)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Obx(
                () => AddOnTile(
                  addOn: addOn,
                  selected: controller.selectedAddOnIds.contains(addOn.id),
                  onTap: () => controller.toggleAddOn(addOn.id),
                ),
              ),
            ),
        ],
      ),
    bottomNavigationBar: Obx(
  () => BottomPriceBar(
    priceText:
        'price_aed'.trParams({'price': controller.total.toStringAsFixed(0)}),
    buttonText: 'continue_booking'.tr,
    onPressed: controller.continueBooking,
  ),
),
    );
  }
}

class _Header extends StatelessWidget {
  final WashService service;
  const _Header({required this.service});

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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: whiteColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(service.icon, color: whiteColor, size: 30),
              ),
              const Spacer(),
              _Pill(
                icon: Icons.schedule_rounded,
                text: 'duration_min'
                    .trParams({'min': service.durationMinutes.toString()}),
              ),
              if (service.isWaterless) ...[
                const SizedBox(width: 8),
                _Pill(icon: Icons.eco_rounded, text: 'eco_badge'.tr),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Text(
            service.titleKey.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: whiteColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            service.descKey.tr,
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

class _Pill extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Pill({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: whiteColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: whiteColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _IncludesCard extends StatelessWidget {
  final List<String> keys;
  const _IncludesCard({required this.keys});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (final key in keys)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded,
                      size: 20, color: primaryBlue),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      key.tr,
                      style: TextStyle(
                        fontFamily: cairo,
                        fontWeight: FontWeight.w600,
                        color: darkNavy,
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