import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashController extends GetxController {
  final _box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(milliseconds: 2200));

    // مرحلة الواجهات: الحالة مخزنة محلياً فقط.
    // لاحقاً: نستبدلها بفحص FirebaseAuth.currentUser.
    final loggedIn = _box.read<bool>(StorageKeys.loggedIn) ?? false;
    final seenOnboarding = _box.read<bool>(StorageKeys.onboardingSeen) ?? false;

    if (loggedIn) {
      Get.offAllNamed(Routes.home);
    } else if (seenOnboarding) {
      Get.offAllNamed(Routes.login);
    } else {
      Get.offAllNamed(Routes.onboarding);
    }
  }
}
