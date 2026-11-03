import 'package:bariq/controller/app/tracking_controller.dart';
import 'package:get/get.dart';


class TrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingController>(() => TrackingController());
  }
}