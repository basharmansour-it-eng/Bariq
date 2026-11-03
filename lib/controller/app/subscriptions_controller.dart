import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/functions/confirm_dialog.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/payment_method.dart';
import 'package:bariq/model/subscription_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'main_controller.dart';

class SubscriptionsController extends GetxController {
  final _box = GetStorage();

  final subscriptions = <SubscriptionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  // لاحقاً: تُقرأ من Firestore (subscriptions حيث userId == uid)
  void _load() {
    final raw = _box.read<List>(StorageKeys.subscriptions) ?? [];
    subscriptions.assignAll(
      raw.map((e) =>
          SubscriptionModel.fromJson(Map<String, dynamic>.from(e as Map))),
    );
  }

  void _save() {
    _box.write(StorageKeys.subscriptions,
        subscriptions.map((s) => s.toJson()).toList());
  }

  /// الأحدث أولاً
  void addSubscription(SubscriptionModel subscription) {
    subscriptions.insert(0, subscription);
    _save();
  }

  void _replace(SubscriptionModel updated) {
    final i = subscriptions.indexWhere((s) => s.id == updated.id);
    if (i == -1) return;
    subscriptions[i] = updated;
    _save();
  }

  /// تبديل التجديد بين تلقائي ويدوي
  void toggleRenewal(SubscriptionModel s) {
    final target = s.renewalMode == RenewalMode.auto
        ? RenewalMode.manual
        : RenewalMode.auto;

    // التجديد التلقائي يحتاج وسيلة دفع قابلة للخصم المتكرر
    if (target == RenewalMode.auto && s.paymentMethod == PaymentMethod.cash) {
      Get.snackbar('app_name'.tr, 'subs_auto_needs_card'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // لاحقاً: تحديث الجدولة في الخادم
    _replace(s.copyWith(renewalMode: target));
    Get.snackbar('app_name'.tr, 'subs_renewal_updated'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> cancelSubscription(SubscriptionModel s) async {
    final ok = await confirmDialog(
      title: 'subs_cancel_title'.tr,
      message: 'subs_cancel_confirm'.trParams({'plan': s.titleKey.tr}),
      confirmText: 'subs_cancel'.tr,
      cancelText: 'keep_subscription'.tr,
    );
    if (!ok) return;

    // لاحقاً: Cloud Function تلغي الجدولة وتعالج أي استرجاع حسب سياستك
    _replace(s.copyWith(status: SubscriptionStatus.cancelled));
    Get.snackbar('app_name'.tr, 'subs_cancelled'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  /// من الحالة الفارغة: الانتقال إلى تبويب العروض لاستعراض الباقات
  void browsePlans() {
    Get.until((route) => route.settings.name == Routes.home);
    Get.find<MainController>().changeTab(2);
  }

  // ───────── مؤقت: يُحذف عند ربط الغسلات الفعلية بالحجوزات ─────────
  void useWash(String id) {
    final i = subscriptions.indexWhere((s) => s.id == id);
    if (i == -1) return;
    final s = subscriptions[i];
    if (s.status != SubscriptionStatus.active) return;
    // بعد آخر غسلة نرجع للصفر لتعيد التجربة
    final next = s.washesUsed >= s.washesPerMonth ? 0 : s.washesUsed + 1;
    _replace(s.copyWith(washesUsed: next));
  }
}