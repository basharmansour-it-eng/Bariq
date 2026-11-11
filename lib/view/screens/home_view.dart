import 'package:bariq/controller/app/home_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/fade_slide_in.dart';
import '../widgets/hero_banner.dart';
import '../widgets/home_header.dart';
import '../widgets/home_section_title.dart';
import '../widgets/service_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [darkNavy.withValues(alpha: 0.07), Colors.grey.shade100],
            stops: const [0, 0.45],
          ),
        ),
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            children: [
              const HomeHeader(),
              const SizedBox(height: 22),
              HeroBanner(
                title: 'tagline'.tr,
                onBookNow: controller.onBookNow,
                onSchedule: controller.onSchedule,
              ),
              const SizedBox(height: 30),
              HomeSectionTitle(
                title: 'our_services'.tr,
                onSeeAll: () => Get.toNamed(Routes.allServices),
              ),
              const SizedBox(height: 12),
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
                itemBuilder: (_, i) {
                  final service = controller.services[i];
                  return FadeSlideIn(
                    index: i,
                    child: ServiceCard(
                      service: service,
                      onTap: () => controller.openService(service),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
