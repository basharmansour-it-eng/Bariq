import 'package:bariq/controller/app/subscriptions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/empty_state.dart';
import '../widgets/my_subscription_card.dart';

class SubscriptionsView extends GetView<SubscriptionsController> {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile_subscriptions'.tr)),
      body: Obx(() {
        final list = controller.subscriptions.toList();

        if (list.isEmpty) {
          return EmptyState(
            icon: Icons.autorenew_rounded,
            title: 'subs_empty_title'.tr,
            description: 'subs_empty_desc'.tr,
            actionText: 'subs_browse'.tr,
            onAction: controller.browsePlans,
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          itemCount: list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (_, i) {
            final sub = list[i];
            return MySubscriptionCard(
              subscription: sub,
              onToggleRenewal: () => controller.toggleRenewal(sub),
              onCancel: () => controller.cancelSubscription(sub),
              // مؤقت: ضغط مطوّل لتسجيل غسلة مستخدمة أثناء التجربة
              onLongPress: () => controller.useWash(sub.id),
            );
          },
        );
      }),
    );
  }
}