import 'package:bariq/controller/app/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/empty_state.dart';
import '../widgets/notification_tile.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  Widget _dismissBackground(AlignmentGeometry alignment) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: Colors.redAccent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notif_title'.tr),
        actions: [
          Obx(
            () => controller.unreadCount > 0
                ? TextButton(
                    onPressed: controller.markAllRead,
                    child: Text('notif_mark_all'.tr),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
      body: Obx(() {
        final list = controller.items.toList();

        if (list.isEmpty) {
          return EmptyState(
            icon: Icons.notifications_none_rounded,
            title: 'notif_empty_title'.tr,
            description: 'notif_empty_desc'.tr,
          );
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (_, i) {
            final n = list[i];
            return Dismissible(
              key: ValueKey(n.id),
              background: _dismissBackground(AlignmentDirectional.centerStart),
              secondaryBackground:
                  _dismissBackground(AlignmentDirectional.centerEnd),
              onDismissed: (_) => controller.remove(n.id),
              child: NotificationTile(
                notification: n,
                onTap: () => controller.open(n),
              ),
            );
          },
        );
      }),
    );
  }
}