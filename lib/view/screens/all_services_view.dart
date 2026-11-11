import 'package:bariq/controller/app/home_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/fade_slide_in.dart';
import '../widgets/service_list_card.dart';

/// تقرأ من HomeController الموجود أصلاً (لا كنترولر جديد).
/// لاحقاً عند جلب الخدمات من Firestore كـ .obs نغلّف القائمة بـ Obx.
class AllServicesView extends GetView<HomeController> {
  const AllServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final services = controller.services;

    return Scaffold(
      appBar: AppBar(title: Text('our_services'.tr)),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          Text(
            'all_services_subtitle'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 14,
              color: darkNavy.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < services.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: FadeSlideIn(
                index: i,
                child: ServiceListCard(
                  service: services[i],
                  onTap: () => controller.openService(services[i]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}