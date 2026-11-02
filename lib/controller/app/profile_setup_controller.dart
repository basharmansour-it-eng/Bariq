import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/functions/validators.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ProfileSetupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final isNameValid = false.obs;
  final isEmailValid = true.obs; // اختياري: الفارغ مقبول
  final isLoading = false.obs;

  String get _phone => (Get.arguments as String?) ?? '';

  bool get canContinue => isNameValid.value && isEmailValid.value;

  void onNameChanged(String v) => isNameValid.value = Validators.isValidName(v);

  void onEmailChanged(String v) {
    final text = v.trim();
    isEmailValid.value = text.isEmpty || Validators.isEmail(text);
  }

  Future<void> save() async {
    if (!canContinue || isLoading.value) return;

    isLoading.value = true;
    // لاحقاً: حفظ البيانات في Firestore (users/{uid})
    await Future.delayed(const Duration(milliseconds: 700));

    final box = GetStorage();
    await box.write(StorageKeys.userName, nameController.text.trim());
    await box.write(StorageKeys.userEmail, emailController.text.trim());
    await box.write(StorageKeys.userPhone, _phone);
    await box.write(StorageKeys.loggedIn, true);

    isLoading.value = false;
    Get.offAllNamed(Routes.home);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
