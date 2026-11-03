import 'package:bariq/controller/app/plan_details_controller.dart';
import 'package:get/get.dart';


class PlanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanDetailsController>(() => PlanDetailsController());
  }
}