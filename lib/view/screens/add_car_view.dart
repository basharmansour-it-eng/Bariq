import 'package:bariq/controller/app/add_car_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/car_color_picker.dart';
import '../widgets/car_type_selector.dart';
import '../widgets/emirate_selector.dart';
import '../widgets/form_label.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/plate_badge.dart';
import '../widgets/primary_button.dart';

class AddCarView extends GetView<AddCarController> {
  const AddCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add_car'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledTextField(
              label: 'car_brand'.tr,
              hint: 'car_brand_hint'.tr,
              controller: controller.brandController,
              onChanged: (v) => controller.brand.value = v,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            LabeledTextField(
              label: 'car_model'.tr,
              hint: 'car_model_hint'.tr,
              controller: controller.modelController,
              onChanged: (v) => controller.model.value = v,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 24),

            // نوع السيارة
            FormLabel('car_type'.tr),
            const SizedBox(height: 4),
            Text(
              'car_type_hint'.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 12,
                color: darkNavy.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => CarTypeSelector(
                selected: controller.type.value,
                onChanged: (t) => controller.type.value = t,
              ),
            ),
            const SizedBox(height: 24),

            // اللون
            FormLabel('car_color'.tr),
            const SizedBox(height: 10),
            Obx(
              () => CarColorPicker(
                selected: controller.colorValue.value,
                onChanged: (v) => controller.colorValue.value = v,
              ),
            ),
            const SizedBox(height: 24),

            // اللوحة
            FormLabel('plate_title'.tr),
            const SizedBox(height: 8),
            Obx(
              () => EmirateSelector(
                value: controller.emirate.value,
                onChanged: (e) => controller.emirate.value = e,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: LabeledTextField(
                    label: 'plate_code'.tr,
                    hint: 'A',
                    controller: controller.codeController,
                    onChanged: (v) => controller.code.value = v,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.characters,
                    textDirection: TextDirection.ltr,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]')),
                      LengthLimitingTextInputFormatter(2),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: LabeledTextField(
                    label: 'plate_number'.tr,
                    hint: '12345',
                    controller: controller.numberController,
                    onChanged: (v) => controller.number.value = v,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    textDirection: TextDirection.ltr,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(5),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // معاينة اللوحة
            Center(
              child: Obx(
                () => PlateBadge(
                  emirate: controller.emirate.value,
                  code: controller.code.value.isEmpty
                      ? 'A'
                      : controller.code.value.toUpperCase(),
                  number: controller.number.value.isEmpty
                      ? '12345'
                      : controller.number.value,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Obx(
            () => PrimaryButton(
              text: 'save_car'.tr,
              onPressed: controller.canSave ? controller.save : null,
            ),
          ),
        ),
      ),
    );
  }
}