import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/promo_code_model.dart';
import 'package:bariq/model/subscription_plan_model.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class OffersController extends GetxController {
  // لاحقاً: تأتي من Firestore
  final plans = sampleSubscriptionPlans;
  final promos = samplePromoCodes;

  /// الخدمة التي تقوم عليها الباقة (لحساب سعرها)
  WashService? serviceFor(SubscriptionPlan plan) => Get.find<HomeController>()
      .services
      .firstWhereOrNull((s) => s.category == plan.category);

  Future<void> copyCode(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    Get.snackbar('app_name'.tr, 'code_copied'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

void openPlan(SubscriptionPlan plan) {
  Get.toNamed(Routes.planDetails, arguments: plan);
}
}