import 'package:bariq/core/constant/const.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_bell.dart';

/// رأس الرئيسية: التحية + العنوان الفرعي + جرس الإشعارات + زر اللغة.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'home_subtitle'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  color: darkNavy.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        NotificationBell(onTap: () => Get.toNamed(Routes.notifications)),
        const SizedBox(width: 4),
      ],
    );
  }
}
