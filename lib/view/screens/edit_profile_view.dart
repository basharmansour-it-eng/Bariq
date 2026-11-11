import 'package:bariq/controller/app/edit_profile_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/form_label.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/primary_button.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('edit_profile'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightCyan.withValues(alpha: 0.3),
                ),
                child: const Icon(Icons.person_rounded,
                    size: 48, color: primaryBlue),
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => LabeledTextField(
                label: 'full_name'.tr,
                hint: 'full_name_hint'.tr,
                controller: controller.nameController,
                onChanged: controller.onChanged,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                prefixIcon: Icons.person_outline_rounded,
                errorText:
                    controller.isNameValid.value ? null : 'name_invalid'.tr,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => LabeledTextField(
                label: 'email_optional'.tr,
                hint: 'name@example.com',
                controller: controller.emailController,
                onChanged: controller.onChanged,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                textDirection: TextDirection.ltr,
                prefixIcon: Icons.mail_outline_rounded,
                errorText:
                    controller.isEmailValid.value ? null : 'email_invalid'.tr,
              ),
            ),
            const SizedBox(height: 16),
            FormLabel('phone_label'.tr),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: controller.displayPhone,
              enabled: false,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: cairo,
                fontWeight: FontWeight.w600,
                color: darkNavy.withValues(alpha: 0.5),
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_outlined),
                suffixIcon: Icon(Icons.lock_outline_rounded, size: 18),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'phone_cannot_change'.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 12,
                color: darkNavy.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 28),
            Obx(
              () => PrimaryButton(
                text: 'save_changes'.tr,
                isLoading: controller.isSaving.value,
                onPressed: controller.canSave ? controller.save : null,
              ),
            ),
            const SizedBox(height: 32),

            // ───── منطقة الخطر: حذف الحساب ─────
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.redAccent.withValues(alpha: 0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'delete_account'.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'delete_account_desc'.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 13,
                      height: 1.6,
                      color: darkNavy.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Obx(
                    () => OutlinedButton(
                      onPressed: controller.isDeleting.value
                          ? null
                          : controller.deleteAccount,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                        side: BorderSide(
                          color: Colors.redAccent.withValues(alpha: 0.5),
                          width: 1.4,
                        ),
                      ),
                      child: controller.isDeleting.value
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.4,
                                color: Colors.redAccent,
                              ),
                            )
                          : Text('delete_account'.tr),
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