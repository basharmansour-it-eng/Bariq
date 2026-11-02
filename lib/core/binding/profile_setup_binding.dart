import 'package:bariq/controller/app/profile_setup_controller.dart';
import 'package:get/get.dart';


class ProfileSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSetupController>(() => ProfileSetupController());
  }
}
