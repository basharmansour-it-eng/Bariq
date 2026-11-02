import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  final pages = const <OnboardingItem>[
    OnboardingItem(
      icon: Icons.location_on_rounded,
      titleKey: 'onb1_title',
      descKey: 'onb1_desc',
    ),
    OnboardingItem(
      icon: Icons.water_drop_rounded,
      titleKey: 'onb2_title',
      descKey: 'onb2_desc',
    ),
    OnboardingItem(
      icon: Icons.verified_rounded,
      titleKey: 'onb3_title',
      descKey: 'onb3_desc',
    ),
  ];

  bool get isLast => currentPage.value == pages.length - 1;

  void onPageChanged(int index) => currentPage.value = index;

  void next() {
    if (isLast) {
      finish();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    }
  }

  void finish() {
    GetStorage().write(StorageKeys.onboardingSeen, true);
    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
