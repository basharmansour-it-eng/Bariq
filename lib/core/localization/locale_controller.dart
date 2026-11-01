import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// يدير لغة التطبيق ويحفظ اختيار المستخدم محلياً.
class LocaleController extends GetxController {
  static const _storageKey = 'app_lang';
  final _box = GetStorage();

  late Locale locale;

  bool get isArabic => locale.languageCode == 'ar';

  @override
  void onInit() {
    super.onInit();
    final saved = _box.read<String>(_storageKey) ?? 'ar';
    locale = Locale(saved);
  }

  Future<void> changeLanguage(String code) async {
    locale = Locale(code);
    await _box.write(_storageKey, code);
    Get.updateLocale(locale);
    update();
  }

  void toggle() => changeLanguage(isArabic ? 'en' : 'ar');
}
