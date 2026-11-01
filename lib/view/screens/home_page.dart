import 'package:bariq/controller/app/home_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/hero_card.dart';
import '../widgets/language_button.dart';
import '../widgets/service_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            const _Header(),
            const SizedBox(height: 20),
            HeroCard(
              onBookNow: controller.onBookNow,
              onSchedule: controller.onSchedule,
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'our_services'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('see_all'.tr),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (_, i) =>
                  ServiceCard(service: controller.services[i]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: whiteColor,
          indicatorColor: lightCyan.withValues(alpha: 0.35),
          selectedIndex: controller.currentTab.value,
          onDestinationSelected: controller.changeTab,
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home_rounded),
                label: 'tab_home'.tr),
            NavigationDestination(
                icon: const Icon(Icons.receipt_long_outlined),
                selectedIcon: const Icon(Icons.receipt_long_rounded),
                label: 'tab_orders'.tr),
            NavigationDestination(
                icon: const Icon(Icons.local_offer_outlined),
                selectedIcon: const Icon(Icons.local_offer_rounded),
                label: 'tab_offers'.tr),
            NavigationDestination(
                icon: const Icon(Icons.person_outline_rounded),
                selectedIcon: const Icon(Icons.person_rounded),
                label: 'tab_profile'.tr),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hello'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'home_subtitle'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  color: darkNavy.withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
        ),
        const LanguageButton(),
      ],
    );
  }
}
