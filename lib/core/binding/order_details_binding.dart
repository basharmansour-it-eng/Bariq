import 'package:bariq/controller/app/order_details_controller.dart';
import 'package:get/get.dart';


class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
  }
}