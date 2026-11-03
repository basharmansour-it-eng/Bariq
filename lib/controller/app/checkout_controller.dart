import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/booking_draft.dart';
import 'package:bariq/model/order_model.dart';
import 'package:bariq/model/payment_method.dart';
import 'package:bariq/model/promo_code_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';
import 'orders_controller.dart';

class CheckoutController extends GetxController {
  late final BookingDraft draft;

  final promoController = TextEditingController();
  final appliedPromo = Rxn<PromoCode>();
  final promoError = RxnString(); // مفتاح ترجمة

  final methods = availablePaymentMethods();
  late final paymentMethod = Rx<PaymentMethod>(methods.first);

  final isLoading = false.obs;

  double get discount => appliedPromo.value?.discountFor(draft.subtotal) ?? 0;

  double get total => draft.subtotal - discount;

  @override
  void onInit() {
    super.onInit();
    draft = Get.arguments as BookingDraft;
  }

  void applyPromo() {
    final code = promoController.text.trim().toUpperCase();
    if (code.isEmpty) return;

    // لاحقاً: يُتحقق من الكود في الخادم (Cloud Function)
    final found = samplePromoCodes.firstWhereOrNull((p) => p.code == code);
    if (found == null) {
      promoError.value = 'promo_invalid';
      return;
    }
    promoError.value = null;
    appliedPromo.value = found;
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void removePromo() {
    appliedPromo.value = null;
    promoController.clear();
  }

  Future<void> confirm() async {
    if (isLoading.value) return;
    isLoading.value = true;

    // لاحقاً: Cloud Function تنشئ الطلب وتنفّذ الدفع وتتحقق من السعر في الخادم
    await Future.delayed(const Duration(milliseconds: 900));

    final order = OrderModel.fromDraft(
      draft: draft,
      paymentMethod: paymentMethod.value,
      discount: discount,
      promoCode: appliedPromo.value?.code,
    );
    Get.find<OrdersController>().addOrder(order);

    isLoading.value = false;

    // نعود للهيكل الرئيسي (دون إعادة إنشائه) وننتقل لتبويب «طلباتي»
    Get.until((route) => route.settings.name == Routes.home);
    Get.find<MainController>().changeTab(1);
    Get.snackbar('app_name'.tr, 'booking_confirmed'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    promoController.dispose();
    super.onClose();
  }
}