import 'package:bariq/controller/app/orders_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/empty_state.dart';
import '../widgets/order_card.dart';
import '../widgets/segmented_tabs.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'tab_orders'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => SegmentedTabs(
                  labels: [
                    '${'orders_active'.tr} (${controller.activeOrders.length})',
                    '${'orders_past'.tr} (${controller.pastOrders.length})',
                  ],
                  selectedIndex: controller.tabIndex.value,
                  onChanged: (i) => controller.tabIndex.value = i,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(() {
                final list = controller.visibleOrders;
                final isActiveTab = controller.tabIndex.value == 0;

                if (list.isEmpty) {
                  return EmptyState(
                    icon: Icons.receipt_long_rounded,
                    title: isActiveTab
                        ? 'orders_empty_active_title'.tr
                        : 'orders_empty_past_title'.tr,
                    description: isActiveTab
                        ? 'orders_empty_active_desc'.tr
                        : 'orders_empty_past_desc'.tr,
                    actionText: isActiveTab ? 'book_now_short'.tr : null,
                    onAction: isActiveTab ? controller.goBook : null,
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) {
                    final order = list[i];
                    return OrderCard(
                      order: order,
                      onTap: () => controller.openOrder(order),
                      // مؤقت: ضغط مطوّل لتغيير الحالة أثناء التجربة
                      onLongPress: () => controller.advanceStatus(order.id),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}