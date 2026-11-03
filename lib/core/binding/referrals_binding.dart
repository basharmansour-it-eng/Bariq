import 'package:bariq/controller/app/referrals_controller.dart';
import 'package:get/get.dart';


class ReferralsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferralsController>(() => ReferralsController());
  }
}