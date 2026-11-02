import 'package:bariq/controller/app/main_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/view/screens/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = controller.currentTab.value;

      // زر الرجوع في أي تبويب يعيدك للرئيسية أولاً، ثم يخرج من التطبيق
      return PopScope(
        canPop: index == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) controller.changeTab(0);
        },
        child: Scaffold(
          // IndexedStack يحفظ حالة كل تبويب (التمرير وغيره) عند التنقل
          body: IndexedStack(
            index: index,
            children: const [
              HomeView(),
              _ComingSoon(
                icon: Icons.receipt_long_rounded,
                titleKey: 'tab_orders',
              ),
              _ComingSoon(
                icon: Icons.local_offer_rounded,
                titleKey: 'tab_offers',
              ),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: whiteColor,
            indicatorColor: lightCyan.withValues(alpha: 0.35),
            selectedIndex: index,
            onDestinationSelected: controller.changeTab,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home_rounded),
                label: 'tab_home'.tr,
              ),
              NavigationDestination(
                icon: const Icon(Icons.receipt_long_outlined),
                selectedIcon: const Icon(Icons.receipt_long_rounded),
                label: 'tab_orders'.tr,
              ),
              NavigationDestination(
                icon: const Icon(Icons.local_offer_outlined),
                selectedIcon: const Icon(Icons.local_offer_rounded),
                label: 'tab_offers'.tr,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline_rounded),
                selectedIcon: const Icon(Icons.person_rounded),
                label: 'tab_profile'.tr,
              ),
            ],
          ),
        ),
      );
    });
  }
}

/// مكان مؤقت للتبويبات التي لم نبنها بعد، نستبدل كلاً منها بصفحتها الحقيقية.
class _ComingSoon extends StatelessWidget {
  final IconData icon;
  final String titleKey;

  const _ComingSoon({required this.icon, required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightCyan.withValues(alpha: 0.3),
              ),
              child: Icon(icon, size: 44, color: primaryBlue),
            ),
            const SizedBox(height: 16),
            Text(
              titleKey.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: darkNavy,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'coming_soon'.tr,
              style: TextStyle(
                fontFamily: cairo,
                color: darkNavy.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
