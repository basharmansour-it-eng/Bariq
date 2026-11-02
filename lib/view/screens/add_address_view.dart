import 'package:bariq/controller/app/add_address_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/address_type_selector.dart';
import '../widgets/emirate_selector.dart';
import '../widgets/form_label.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/primary_button.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add_address'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MapPickerTile(onTap: controller.pickOnMap),
            const SizedBox(height: 14),
            Center(
              child: Text(
                'manual_entry'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 12,
                  color: darkNavy.withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(height: 20),

            FormLabel('address_type_label'.tr),
            const SizedBox(height: 10),
            Obx(
              () => AddressTypeSelector(
                selected: controller.type.value,
                onChanged: (t) => controller.type.value = t,
              ),
            ),
            const SizedBox(height: 20),

            FormLabel('address_emirate'.tr),
            const SizedBox(height: 8),
            Obx(
              () => EmirateSelector(
                value: controller.emirate.value,
                onChanged: (e) => controller.emirate.value = e,
              ),
            ),
            const SizedBox(height: 16),

            LabeledTextField(
              label: 'address_area'.tr,
              hint: 'address_area_hint'.tr,
              controller: controller.areaController,
              onChanged: (v) => controller.area.value = v,
              prefixIcon: Icons.map_outlined,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            LabeledTextField(
              label: 'address_building'.tr,
              hint: 'address_building_hint'.tr,
              controller: controller.buildingController,
              onChanged: (v) => controller.building.value = v,
              prefixIcon: Icons.apartment_rounded,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            LabeledTextField(
              label: 'address_details'.tr,
              hint: 'address_details_hint'.tr,
              controller: controller.detailsController,
              onChanged: (v) => controller.details.value = v,
              prefixIcon: Icons.local_parking_rounded,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Obx(
            () => PrimaryButton(
              text: 'save_address'.tr,
              onPressed: controller.canSave ? controller.save : null,
            ),
          ),
        ),
      ),
    );
  }
}

/// بطاقة «تحديد الموقع على الخريطة». حالياً تعرض «قريباً» وتُربط بالخريطة لاحقاً.
class _MapPickerTile extends StatelessWidget {
  final VoidCallback onTap;
  const _MapPickerTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: primaryBlue.withValues(alpha: 0.35), width: 1.4),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightCyan.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.my_location_rounded,
                    color: primaryBlue, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'pick_on_map'.tr,
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: darkNavy,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'pick_on_map_hint'.tr,
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 12,
                        color: darkNavy.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: darkNavy.withValues(alpha: 0.35)),
            ],
          ),
        ),
      ),
    );
  }
}