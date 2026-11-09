import 'package:bariq/controller/app/profile_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/locale_controller.dart';
import '../widgets/menu_card.dart';
import '../widgets/menu_tile.dart';
import '../widgets/section_label.dart';
import '../widgets/user_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text(
              'tab_profile'.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: darkNavy,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => UserCard(
                name: controller.userName.value.isEmpty
                    ? 'guest_user'.tr
                    : controller.userName.value,
                phone: controller.displayPhone,
                initial: controller.initial,
              ),
            ),
            const SizedBox(height: 24),
            SectionLabel('section_account'.tr),
            MenuCard(
              children: [
                MenuTile(
                  icon: Icons.directions_car_rounded,
                  title: 'profile_my_cars'.tr,
                  onTap: () => Get.toNamed(Routes.cars),
                ),
                MenuTile(
                  icon: Icons.location_on_rounded,
                  title: 'profile_addresses'.tr,
                  onTap: () => Get.toNamed(Routes.addresses),
                ),
                MenuTile(
                  icon: Icons.autorenew_rounded,
                  title: 'profile_subscriptions'.tr,
                  onTap: () => Get.toNamed(Routes.subscriptions),
                ),
                MenuTile(
                  icon: Icons.card_giftcard_rounded,
                  title: 'profile_invite'.tr,
                  onTap: () => Get.toNamed(Routes.referrals),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SectionLabel('section_general'.tr),
            MenuCard(
              children: [
                MenuTile(
                  icon: Icons.language_rounded,
                  title: 'language'.tr,
                  trailingText: 'switch_language'.tr,
                  onTap: Get.find<LocaleController>().toggle,
                ),
                MenuTile(
                  icon: Icons.headset_mic_rounded,
                  title: 'profile_help'.tr,
                  onTap: () => Get.toNamed(Routes.help),
                ),
                MenuTile(
                  icon: Icons.shield_rounded,
                  title: 'profile_terms'.tr,
                  onTap: () => Get.toNamed(Routes.legal),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MenuCard(
              children: [
                MenuTile(
                  icon: Icons.logout_rounded,
                  title: 'logout'.tr,
                  color: Colors.redAccent,
                  showChevron: false,
                  onTap: _confirmLogout,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Bariq v1.0.0',
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 12,
                  color: darkNavy.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmLogout() {
    Get.dialog(
      AlertDialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'logout'.tr,
          style: TextStyle(
            fontFamily: cairo,
            fontWeight: FontWeight.w800,
            color: darkNavy,
          ),
        ),
        content: Text(
          'logout_confirm'.tr,
          style: TextStyle(fontFamily: cairo, color: darkNavy),
        ),
        actions: [
          TextButton(onPressed: Get.back, child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              Get.back(); // إغلاق نافذة التأكيد
              controller.logout();
            },
            child: Text(
              'logout'.tr,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
