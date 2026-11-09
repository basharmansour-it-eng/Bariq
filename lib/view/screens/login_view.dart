import 'package:bariq/controller/auth/login_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/language_button.dart';
import '../widgets/primary_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: LanguageButton(),
              ),
              const SizedBox(height: 100),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryBlue, secondaryBlue],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.local_car_wash_rounded,
                  size: 38,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'login_title'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'login_subtitle'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  height: 1.6,
                  color: darkNavy.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'phone_label'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w700,
                  color: darkNavy,
                ),
              ),
              const SizedBox(height: 8),
              _PhoneField(controller: controller),
              Obx(() {
                final show =
                    controller.phone.value.isNotEmpty &&
                    !controller.isValid.value;
                return AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: show
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'phone_invalid'.tr,
                            style: TextStyle(
                              fontFamily: cairo,
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        )
                      : const SizedBox(width: double.infinity),
                );
              }),
              const SizedBox(height: 24),
              Obx(
                () => PrimaryButton(
                  text: 'send_code'.tr,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.isValid.value
                      ? controller.sendCode
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.legal),
                  child: Text(
                    'terms_notice'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 12,
                      height: 1.6,
                      color: darkNavy.withValues(alpha: 0.5),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  final LoginController controller;
  const _PhoneField({required this.controller});

  @override
  Widget build(BuildContext context) {
    final borderColor = lightCyan.withValues(alpha: 0.6);

    // الأرقام تُكتب دائماً من اليسار لليمين حتى في الواجهة العربية.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🇦🇪', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 6),
                  Text(
                    '+971',
                    style: TextStyle(
                      fontFamily: cairo,
                      fontWeight: FontWeight.w800,
                      color: darkNavy,
                    ),
                  ),
                ],
              ),
            ),
            Container(width: 1, height: 28, color: borderColor),
            Expanded(
              child: TextField(
                controller: controller.phoneController,
                onChanged: controller.onPhoneChanged,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: darkNavy,
                ),
                decoration: InputDecoration(
                  hintText: '5X XXX XXXX',
                  hintStyle: TextStyle(
                    fontFamily: cairo,
                    letterSpacing: 1.2,
                    color: darkNavy.withValues(alpha: 0.3),
                  ),
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
