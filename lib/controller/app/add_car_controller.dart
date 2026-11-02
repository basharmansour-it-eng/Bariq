import 'package:bariq/core/constant/car_colors.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cars_controller.dart';

class AddCarController extends GetxController {
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final codeController = TextEditingController();
  final numberController = TextEditingController();

  final brand = ''.obs;
  final model = ''.obs;
  final code = ''.obs;
  final number = ''.obs;

  final type = CarType.sedan.obs;
  final colorValue = carColorValues.first.obs;
  final emirate = Emirate.dubai.obs;

  bool get canSave =>
      brand.value.trim().length >= 2 &&
      model.value.trim().isNotEmpty &&
      code.value.trim().isNotEmpty &&
      number.value.trim().isNotEmpty;

  void save() {
    if (!canSave) return;

    final car = CarModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      brand: brand.value.trim(),
      model: model.value.trim(),
      type: type.value,
      colorValue: colorValue.value,
      plateEmirate: emirate.value,
      plateCode: code.value.trim().toUpperCase(),
      plateNumber: number.value.trim(),
    );

    // لاحقاً: الحفظ في Firestore بدل التخزين المحلي
    Get.find<CarsController>().addCar(car);

    Get.back();
    Get.snackbar('app_name'.tr, 'car_added'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    brandController.dispose();
    modelController.dispose();
    codeController.dispose();
    numberController.dispose();
    super.onClose();
  }
}