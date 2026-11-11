import 'package:bariq/controller/app/orders_controller.dart';
import 'package:bariq/controller/app/profile_controller.dart';
import 'package:bariq/controller/app/subscriptions_controller.dart';
import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/functions/confirm_dialog.dart';
import 'package:bariq/core/functions/validators.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditProfileController extends GetxController {
  final _box = GetStorage();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final isNameValid = true.obs;
  final isEmailValid = true.obs;
  final hasChanges = false.obs;
  final isSaving = false.obs;
  final isDeleting = false.obs;

  late final String _initialName;
  late final String _initialEmail;

  /// رقم الهاتف للعرض فقط (لا يمكن تعديله لأن الدخول يتم به)
  String get displayPhone => Get.find<ProfileController>().displayPhone;

  bool get canSave =>
      hasChanges.value && isNameValid.value && isEmailValid.value;

  @override
  void onInit() {
    super.onInit();
    _initialName = _box.read<String>(StorageKeys.userName) ?? '';
    _initialEmail = _box.read<String>(StorageKeys.userEmail) ?? '';
    nameController.text = _initialName;
    emailController.text = _initialEmail;
  }

  void onChanged(String _) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();

    isNameValid.value = Validators.isValidName(name);
    isEmailValid.value = email.isEmpty || Validators.isEmail(email);
    hasChanges.value = name != _initialName || email != _initialEmail;
  }

  Future<void> save() async {
    if (!canSave || isSaving.value) return;

    isSaving.value = true;
    // لاحقاً: تحديث users/{uid} في Firestore
    await Future.delayed(const Duration(milliseconds: 600));

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    await _box.write(StorageKeys.userName, name);
    await _box.write(StorageKeys.userEmail, email);

    // تحديث صفحة «حسابي» فوراً
    Get.find<ProfileController>().userName.value = name;

    isSaving.value = false;
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
    Get.snackbar('app_name'.tr, 'profile_updated'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  /// لا نسمح بالحذف أثناء وجود طلب جارٍ أو اشتراك فعّال
  bool get _hasActiveCommitments {
    final hasActiveOrder = Get.find<OrdersController>().activeOrders.isNotEmpty;
    final hasActiveSubscription = Get.find<SubscriptionsController>()
        .subscriptions
        .any((s) => s.status == SubscriptionStatus.active);
    return hasActiveOrder || hasActiveSubscription;
  }

  Future<void> deleteAccount() async {
    if (isDeleting.value) return;

    if (_hasActiveCommitments) {
      Get.snackbar('app_name'.tr, 'delete_account_blocked'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final ok = await confirmDialog(
      title: 'delete_account'.tr,
      message: 'delete_account_confirm'.tr,
      confirmText: 'delete'.tr,
    );
    if (!ok) return;

    isDeleting.value = true;
    // لاحقاً: Cloud Function تحذف بيانات المستخدم (Firestore + Storage)
    // ثم FirebaseAuth.instance.currentUser!.delete()
    await Future.delayed(const Duration(milliseconds: 900));

    for (final key in StorageKeys.userDataKeys) {
      await _box.remove(key);
    }

    isDeleting.value = false;
    Get.offAllNamed(Routes.login);
    Get.snackbar('app_name'.tr, 'account_deleted'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}