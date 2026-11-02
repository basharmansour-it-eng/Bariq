import 'package:bariq/controller/app/profile_setup_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/primary_button.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightCyan.withValues(alpha: 0.3),
                  ),
                  child: const Icon(Icons.person_rounded,
                      size: 52, color: primaryBlue),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'profile_setup_title'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'profile_setup_subtitle'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  height: 1.6,
                  color: darkNavy.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(height: 28),
              _Label('full_name'.tr),
              const SizedBox(height: 8),
              TextField(
                controller: controller.nameController,
                onChanged: controller.onNameChanged,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'full_name_hint'.tr,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 18),
              _Label('email_optional'.tr),
              const SizedBox(height: 8),
              Obx(
                () => TextField(
                  controller: controller.emailController,
                  onChanged: controller.onEmailChanged,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: 'name@example.com',
                    prefixIcon: const Icon(Icons.mail_outline_rounded),
                    errorText:
                        controller.isEmailValid.value ? null : 'email_invalid'.tr,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Obx(
                () => PrimaryButton(
                  text: 'continue_btn'.tr,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.canContinue ? controller.save : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: cairo,
        fontWeight: FontWeight.w700,
        color: darkNavy,
      ),
    );
  }
}
