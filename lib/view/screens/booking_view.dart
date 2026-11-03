import 'package:bariq/controller/app/booking_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/router/app_routes.dart';
import '../../model/booking_args.dart';
import '../widgets/bottom_price_bar.dart';
import '../widgets/day_selector.dart';
import '../widgets/form_label.dart';
import '../widgets/section_header.dart';
import '../widgets/selectable_tile.dart';
import '../widgets/time_slot_selector.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('booking_title'.tr)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          _ServiceSummary(args: controller.args),
          const SizedBox(height: 24),

          // ───── السيارة ─────
          SectionHeader(
            title: 'booking_choose_car'.tr,
            actionText: 'add_new'.tr,
            onAction: () => Get.toNamed(Routes.addCar),
          ),
          const SizedBox(height: 10),
          Obx(() {
            final cars = controller.cars;
            if (cars.isEmpty) {
              return _AddButton(
                text: 'add_car'.tr,
                onTap: () => Get.toNamed(Routes.addCar),
              );
            }
            return Column(
              children: [
                for (final car in cars)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SelectableTile(
                      icon: car.type.icon,
                      title: car.title,
                      subtitle: '${car.type.labelKey.tr} • '
                          '${car.plateEmirate.labelKey.tr} '
                          '\u2066${car.plateCode} ${car.plateNumber}\u2069',
                      selected: controller.selectedCarId.value == car.id,
                      onTap: () => controller.selectedCarId.value = car.id,
                    ),
                  ),
              ],
            );
          }),
          const SizedBox(height: 14),

          // ───── العنوان ─────
          SectionHeader(
            title: 'booking_choose_address'.tr,
            actionText: 'add_new'.tr,
            onAction: () => Get.toNamed(Routes.addAddress),
          ),
          const SizedBox(height: 10),
          Obx(() {
            final addresses = controller.addresses;
            if (addresses.isEmpty) {
              return _AddButton(
                text: 'add_address'.tr,
                onTap: () => Get.toNamed(Routes.addAddress),
              );
            }
            return Column(
              children: [
                for (final a in addresses)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SelectableTile(
                      icon: a.type.icon,
                      title: a.type.labelKey.tr,
                      subtitle: '${a.emirate.labelKey.tr} • ${a.area}',
                      selected: controller.selectedAddressId.value == a.id,
                      onTap: () => controller.selectedAddressId.value = a.id,
                    ),
                  ),
              ],
            );
          }),
          const SizedBox(height: 14),

          // ───── الوقت ─────
          FormLabel('booking_when'.tr),
          const SizedBox(height: 10),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: _WhenCard(
                    icon: Icons.bolt_rounded,
                    title: 'when_now'.tr,
                    subtitle: 'when_now_hint'.tr,
                    selected: !controller.isScheduled.value,
                    enabled: controller.canBookNow,
                    onTap: () => controller.isScheduled.value = false,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _WhenCard(
                    icon: Icons.event_rounded,
                    title: 'when_schedule'.tr,
                    subtitle: 'when_schedule_hint'.tr,
                    selected: controller.isScheduled.value,
                    enabled: true,
                    onTap: () => controller.isScheduled.value = true,
                  ),
                ),
              ],
            ),
          ),
          if (!controller.canBookNow) ...[
            const SizedBox(height: 8),
            Text(
              'now_unavailable'.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 12,
                color: darkNavy.withValues(alpha: 0.55),
              ),
            ),
          ],
          Obx(() {
            if (!controller.isScheduled.value) return const SizedBox.shrink();

            final dayIndex = controller.selectedDayIndex.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                FormLabel('booking_choose_day'.tr),
                const SizedBox(height: 10),
                DaySelector(
                  days: controller.days,
                  selectedIndex: dayIndex,
                  onChanged: controller.selectDay,
                ),
                const SizedBox(height: 20),
                FormLabel('booking_choose_time'.tr),
                const SizedBox(height: 10),
                TimeSlotSelector(
                  startHours: BookingController.slotHours,
                  selected: controller.selectedSlotHour.value,
                  isAvailable: (h) => controller.isAvailableOn(dayIndex, h),
                  onChanged: (h) => controller.selectedSlotHour.value = h,
                ),
              ],
            );
          }),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomPriceBar(
          priceText: 'price_aed'
              .trParams({'price': controller.total.toStringAsFixed(0)}),
          buttonText: 'review_order'.tr,
          onPressed: controller.canContinue ? controller.continueToReview : null,
        ),
      ),
    );
  }
}

/// ملخص الخدمة المختارة في أعلى الصفحة.
class _ServiceSummary extends StatelessWidget {
  final BookingArgs args;
  const _ServiceSummary({required this.args});

  @override
  Widget build(BuildContext context) {
    final addOnsText = args.addOns.isEmpty
        ? 'no_addons'.tr
        : args.addOns.map((a) => a.titleKey.tr).join(' • ');

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryBlue, secondaryBlue],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(args.service.icon, color: whiteColor, size: 26),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  args.service.titleKey.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  addOnsText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 12,
                    color: darkNavy.withValues(alpha: 0.55),
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

/// زر «إضافة» يظهر عندما لا توجد سيارات أو عناوين بعد.
class _AddButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _AddButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.add_rounded),
      label: Text(text),
    );
  }
}

/// بطاقة خيار «الآن / جدولة».
class _WhenCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const _WhenCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.45,
      child: Material(
        color: selected ? primaryBlue : whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: selected ? primaryBlue : lightCyan.withValues(alpha: 0.6),
            width: 1.4,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: enabled ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon,
                    size: 26, color: selected ? whiteColor : primaryBlue),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: selected ? whiteColor : darkNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 12,
                    color: selected
                        ? whiteColor.withValues(alpha: 0.85)
                        : darkNavy.withValues(alpha: 0.55),
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