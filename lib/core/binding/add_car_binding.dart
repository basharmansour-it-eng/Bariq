import 'package:bariq/controller/app/add_car_controller.dart';
import 'package:get/get.dart';


class AddCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCarController>(() => AddCarController());
  }
}