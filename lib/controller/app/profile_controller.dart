import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ProfileController extends GetxController {
  final _box = GetStorage();

  final userName = ''.obs;
  final userPhone = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // لاحقاً: تأتي هذه البيانات من Firestore
    userName.value = _box.read<String>(StorageKeys.userName) ?? '';
    userPhone.value = _box.read<String>(StorageKeys.userPhone) ?? '';
  }

  /// الحرف الأول من الاسم داخل الصورة الرمزية
  String get initial {
    final name = userName.value.trim();
    return name.isEmpty ? '?' : name[0].toUpperCase();
  }

  /// +971 50 123 4567 (مع عزل الاتجاه ليظهر سليماً في الواجهة العربية)
  String get displayPhone {
    final p = userPhone.value;
    if (p.isEmpty) return '';
    if (p.length != 9) return '\u2066+971 $p\u2069';
    return '\u2066+971 ${p.substring(0, 2)} ${p.substring(2, 5)} ${p.substring(5)}\u2069';
  }

  void comingSoon() {
    Get.snackbar('app_name'.tr, 'coming_soon'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> logout() async {
    // نُبقي onboarding_seen حتى لا يرى المستخدم الترحيب مجدداً
    await _box.remove(StorageKeys.loggedIn);
    await _box.remove(StorageKeys.userName);
    await _box.remove(StorageKeys.userPhone);
    await _box.remove(StorageKeys.userEmail);
    await _box.remove(StorageKeys.cars);
    await _box.remove(StorageKeys.addresses);
    // لاحقاً: FirebaseAuth.instance.signOut()
    Get.offAllNamed(Routes.login);
  }
}