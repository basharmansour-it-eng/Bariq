import 'package:bariq/controller/app/onboarding_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/onboarding_item.dart';
import '../widgets/language_button.dart';
import '../widgets/primary_button.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LanguageButton(),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: controller.isLast ? 0 : 1,
                      duration: const Duration(milliseconds: 200),
                      child: TextButton(
                        onPressed: controller.isLast ? null : controller.finish,
                        child: Text('skip'.tr),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.pages.length,
                itemBuilder: (_, i) =>
                    _OnboardingPage(item: controller.pages[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.pages.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: controller.currentPage.value == i ? 26 : 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == i
                                ? primaryBlue
                                : lightCyan.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => PrimaryButton(
                      text: controller.isLast ? 'get_started'.tr : 'next'.tr,
                      onPressed: controller.next,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  const _OnboardingPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // رسم توضيحي بسيط: دائرتان متداخلتان وأيقونة
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  lightCyan.withValues(alpha: 0.45),
                  secondaryBlue.withValues(alpha: 0.12),
                ],
              ),
            ),
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryBlue, secondaryBlue],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withValues(alpha: 0.3),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Icon(item.icon, size: 72, color: whiteColor),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            item.titleKey.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.descKey.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 15,
              height: 1.7,
              color: darkNavy.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }
}
