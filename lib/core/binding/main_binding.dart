import 'package:bariq/controller/app/addresses_controller.dart';
import 'package:bariq/controller/app/cars_controller.dart';
import 'package:bariq/controller/app/main_controller.dart';
import 'package:bariq/controller/app/profile_controller.dart';
import 'package:get/get.dart';

import 'home_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    // تُستخدم من صفحات فرعية فتحتاج fenix: true
    Get.lazyPut<CarsController>(() => CarsController(), fenix: true);
    Get.lazyPut<AddressesController>(() => AddressesController(), fenix: true);
    HomeBinding().dependencies();
  }
}