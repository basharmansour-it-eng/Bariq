import 'package:bariq/controller/auth/otp_controller.dart';
import 'package:get/get.dart';


class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // put لأن الكنترولر يبدأ مؤقت العد التنازلي في onInit.
    Get.put<OtpController>(OtpController());
  }
}
