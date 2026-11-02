import 'package:bariq/model/addon_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:get/get.dart';


import 'cars_controller.dart';

class ServiceDetailsController extends GetxController {
  late final WashService service;

  // لاحقاً: تأتي من Firestore
  final addOns = sampleAddOns;

  final carType = CarType.sedan.obs;
  final selectedAddOnIds = <String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    service = Get.arguments as WashService;

    // نبدأ بنوع سيارة المستخدم الافتراضية إن وُجدت
    final defaultCar = Get.find<CarsController>().defaultCar;
    if (defaultCar != null) carType.value = defaultCar.type;
  }

  double get servicePrice => service.priceFor(carType.value);

  double get addOnsTotal => addOns
      .where((a) => selectedAddOnIds.contains(a.id))
      .fold<double>(0, (sum, a) => sum + a.price);

  double get total => servicePrice + addOnsTotal;

  void toggleAddOn(String id) {
    if (!selectedAddOnIds.remove(id)) selectedAddOnIds.add(id);
  }

  void continueBooking() {
    // التالي: صفحة اختيار السيارة والعنوان والوقت،
    // وسنمرّر لها: service + carType + selectedAddOnIds
    Get.snackbar('app_name'.tr, 'coming_soon'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }
}