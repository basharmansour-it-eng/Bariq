import 'package:bariq/controller/app/notifications_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// جرس الإشعارات مع عدّاد غير المقروء.
class NotificationBell extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationBell({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotificationsController>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: darkNavy.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Obx(() {
          final count = controller.unreadCount;
          return Badge(
            isLabelVisible: count > 0,
            label: Text(count > 9 ? '9+' : '$count'),
            child: Icon(Icons.notifications_none_rounded, color: darkNavy),
          );
        }),
      ),
    );
  }
}
