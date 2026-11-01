import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/locale_controller.dart';

/// زر تبديل اللغة (عربي ⇄ English).
class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LocaleController>();

    return Material(
      color: whiteColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: lang.toggle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language_rounded, size: 18, color: primaryBlue),
              const SizedBox(width: 6),
              Text(
                'switch_language'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w700,
                  color: primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
