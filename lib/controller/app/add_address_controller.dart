import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addresses_controller.dart';

class AddAddressController extends GetxController {
  final areaController = TextEditingController();
  final buildingController = TextEditingController();
  final detailsController = TextEditingController();

  final area = ''.obs;
  final building = ''.obs;
  final details = ''.obs;

  final type = AddressType.home.obs;
  final emirate = Emirate.dubai.obs;

  /// المنطقة مطلوبة، ويلزم أيضاً اسم المبنى أو التفاصيل (الفيلات قد لا يكون لها اسم مبنى)
  bool get canSave =>
      area.value.trim().length >= 2 &&
      (building.value.trim().isNotEmpty || details.value.trim().isNotEmpty);

  void pickOnMap() {
    // لاحقاً: فتح خريطة Google لاختيار الموقع وتعبئة الحقول والإحداثيات
    Get.snackbar('app_name'.tr, 'coming_soon'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  void save() {
    if (!canSave) return;

    final address = AddressModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: type.value,
      emirate: emirate.value,
      area: area.value.trim(),
      building: building.value.trim(),
      details: details.value.trim(),
    );

    // لاحقاً: الحفظ في Firestore بدل التخزين المحلي
    Get.find<AddressesController>().addAddress(address);

    Get.back();
    Get.snackbar('app_name'.tr, 'address_added'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    areaController.dispose();
    buildingController.dispose();
    detailsController.dispose();
    super.onClose();
  }
}