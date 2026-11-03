import 'dart:math';

import 'package:bariq/core/constant/referral_config.dart';
import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/model/referral_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

class ReferralsController extends GetxController {
  final _box = GetStorage();

  final codeController = TextEditingController();

  final code = ''.obs;
  final friends = <ReferralFriend>[].obs;

  /// الكود الذي فعّله المستخدم من صديق (null = لم يفعّل)
  final redeemedCode = RxnString();

  /// مفتاح ترجمة رسالة الخطأ (null = لا خطأ)
  final redeemError = RxnString();

  int get rewardedCount =>
      friends.where((f) => f.status == ReferralStatus.rewarded).length;

  double get totalEarned => rewardedCount * ReferralConfig.referrerReward;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  // لاحقاً: الكود والأصدقاء من Firestore، والكود فريد يولّده الخادم
  void _load() {
    code.value = _box.read<String>(StorageKeys.referralCode) ?? _createCode();
    redeemedCode.value = _box.read<String>(StorageKeys.referredBy);

    final raw = _box.read<List>(StorageKeys.referralFriends) ?? [];
    friends.assignAll(
      raw.map((e) =>
          ReferralFriend.fromJson(Map<String, dynamic>.from(e as Map))),
    );
  }

  String _createCode() {
    // بدون الأحرف المتشابهة (0/O و 1/I) لتسهيل القراءة والكتابة
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rnd = Random();
    final part =
        List.generate(5, (_) => chars[rnd.nextInt(chars.length)]).join();
    final created = 'BQ$part';
    _box.write(StorageKeys.referralCode, created);
    return created;
  }

  void _saveFriends() {
    _box.write(StorageKeys.referralFriends,
        friends.map((f) => f.toJson()).toList());
  }

  Future<void> copyCode() async {
    await Clipboard.setData(ClipboardData(text: code.value));
    Get.snackbar('app_name'.tr, 'ref_code_copied'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> shareCode() async {
    final text = 'ref_share_text'.trParams({
      'code': code.value,
      'amount': ReferralConfig.friendDiscount.toStringAsFixed(0),
    });
    // لاحقاً: نضيف رابط التحميل (Firebase Dynamic Links أو رابط متجر)
    await SharePlus.instance.share(ShareParams(text: text));
  }

  void onCodeChanged(String _) => redeemError.value = null;

  /// تفعيل كود صديق.
  /// لاحقاً: Cloud Function تتحقق (الكود موجود، لم يُستخدم من قبل، ليس كودك،
  /// الحساب جديد ولم يطلب غسلة) وتسجّل الإحالة في Firestore.
  void redeem() {
    final input = codeController.text.trim().toUpperCase();

    if (!RegExp(r'^BQ[A-Z0-9]{5}$').hasMatch(input)) {
      redeemError.value = 'ref_code_invalid';
      return;
    }
    if (input == code.value) {
      redeemError.value = 'ref_own_code';
      return;
    }

    _box.write(StorageKeys.referredBy, input);
    redeemedCode.value = input;
    FocusManager.instance.primaryFocus?.unfocus();
    Get.snackbar('app_name'.tr, 'ref_redeemed'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  // ───────── مؤقت: يُحذف عند ربط الإحالات بالخادم ─────────
  static const _sampleNames = ['سارة', 'خالد', 'Omar', 'ليلى', 'Hassan'];

  void simulateProgress() {
    final i = friends.indexWhere((f) => f.status == ReferralStatus.pending);
    if (i != -1) {
      friends[i] = friends[i].copyWith(status: ReferralStatus.rewarded);
    } else {
      friends.insert(
        0,
        ReferralFriend(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          name: _sampleNames[friends.length % _sampleNames.length],
          joinedAt: DateTime.now(),
        ),
      );
    }
    _saveFriends();
  }
}