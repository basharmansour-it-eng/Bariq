import 'package:bariq/core/functions/validators.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final phoneController = TextEditingController();

  final phone = ''.obs;
  final isValid = false.obs;
  final isLoading = false.obs;

  void onPhoneChanged(String raw) {
    var value = raw;

    // لو كتب المستخدم 05xxxxxxxx نحذف الأصفار من البداية.
    if (value.startsWith('0')) {
      value = value.replaceFirst(RegExp(r'^0+'), '');
      phoneController.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }

    phone.value = value;
    isValid.value = Validators.isUaePhone(value);
  }

  Future<void> sendCode() async {
    if (!isValid.value || isLoading.value) return;

    isLoading.value = true;
    // لاحقاً: FirebaseAuth.verifyPhoneNumber('+971${phone.value}')
    await Future.delayed(const Duration(milliseconds: 900));
    isLoading.value = false;

    Get.toNamed(Routes.otp, arguments: phone.value);
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
