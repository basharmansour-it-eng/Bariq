import 'package:bariq/core/router/app_routes.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(milliseconds: 2200));
    // لاحقاً: افحص هنا إن كان المستخدم مسجّلاً الدخول
    // (توجّه إلى login أو onboarding أو home).
    Get.offAllNamed(Routes.home);
  }
}
