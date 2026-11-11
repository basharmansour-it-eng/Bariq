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
  icon: Icons.edit_rounded,
  title: 'edit_profile'.tr,
  onTap: () => Get.toNamed(Routes.editProfile),
),
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
                  trailingText: Get.find<LocaleController>().isArabic
                      ? 'العربية'
                      : 'English',
                  onTap: _showLanguageSheet,
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

  void _showLanguageSheet() {
    final lang = Get.find<LocaleController>();

    void select(String code) {
      Get.back(); // إغلاق القائمة
      if (lang.locale.languageCode != code) lang.changeLanguage(code);
    }

    Get.bottomSheet(
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: darkNavy.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'language'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                ),
              ),
              const SizedBox(height: 16),
              _LanguageOption(
                label: 'العربية',
                selected: lang.locale.languageCode == 'ar',
                onTap: () => select('ar'),
              ),
              const SizedBox(height: 10),
              _LanguageOption(
                label: 'English',
                selected: lang.locale.languageCode == 'en',
                onTap: () => select('en'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? primaryBlue.withValues(alpha: 0.08) : backgroundColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? primaryBlue : Colors.transparent,
              width: 1.4,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: selected ? primaryBlue : darkNavy,
                  ),
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded, color: primaryBlue),
            ],
          ),
        ),
      ),
    );
  }
}
