import 'dart:async';

import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OtpController extends GetxController {
  static const codeLength = 6;
  static const resendSeconds = 30;

  late final String phone;

  final codeController = TextEditingController();
  final focusNode = FocusNode();

  final code = ''.obs;
  final isLoading = false.obs;
  final secondsLeft = resendSeconds.obs;

  Timer? _timer;

  /// الرقم بصيغة دولية مع عزل اتجاه النص (LTR) ليظهر سليماً داخل جملة عربية.
  String get displayPhone => '⁦+971 $phone⁩';

  /// العد التنازلي بصيغة 00:30
  String get timeText {
    final s = secondsLeft.value;
    return '00:${s.toString().padLeft(2, '0')}';
  }

  @override
  void onInit() {
    super.onInit();
    phone = (Get.arguments as String?) ?? '';
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    secondsLeft.value = resendSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsLeft.value <= 1) {
        secondsLeft.value = 0;
        t.cancel();
      } else {
        secondsLeft.value--;
      }
    });
  }

  void onCodeChanged(String value) {
    code.value = value;
    if (value.length == codeLength) verify();
  }

  Future<void> resend() async {
    if (secondsLeft.value > 0) return;
    codeController.clear();
    code.value = '';
    _startTimer();
    // لاحقاً: إعادة طلب الرمز من Firebase
    Get.snackbar('app_name'.tr, 'code_resent'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> verify() async {
    if (code.value.length != codeLength || isLoading.value) return;

    isLoading.value = true;
    // مرحلة الواجهات: أي رمز من 6 أرقام يُقبل.
    // لاحقاً: credential.signIn ثم فحص هل المستخدم جديد أم قديم.
    await Future.delayed(const Duration(milliseconds: 900));
    isLoading.value = false;

    Get.offAllNamed(Routes.profileSetup, arguments: phone);
  }

  @override
  void onClose() {
    _timer?.cancel();
    codeController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
