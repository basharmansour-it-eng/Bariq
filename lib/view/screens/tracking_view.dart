import 'package:bariq/controller/app/tracking_controller.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/order_model.dart';
import '../widgets/app_card.dart';
import '../widgets/form_label.dart';
import '../widgets/icon_line.dart';
import '../widgets/status_message_card.dart';
import '../widgets/technician_card.dart';
import '../widgets/tracking_map.dart';
import '../widgets/tracking_status_card.dart';

class TrackingView extends GetView<TrackingController> {
  const TrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('track_title'.tr)),
      body: Obx(() {
        final order = controller.order;
        if (order == null) return const SizedBox.shrink();

        final status = order.status;
        final progress = controller.progress.value;
        final arrived = controller.arrived;
        final isLive =
            status == OrderStatus.onTheWay || status == OrderStatus.inProgress;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          children: [
            if (status == OrderStatus.onTheWay) ...[
              TrackingStatusCard(
                title: arrived
                    ? 'track_arrived'.tr
                    : 'track_on_the_way'.tr,
                subtitle: arrived
                    ? 'track_arrived_desc'.tr
                    : 'track_eta'.trParams(
                        {'min': '\u2066${controller.etaMinutes}\u2069'}),
                progress: progress,
              ),
              const SizedBox(height: 14),
              // مؤقت: ضغط مطوّل = إعادة المحاكاة
              GestureDetector(
                onLongPress: controller.restartDemo,
                child: TrackingMap(progress: progress),
              ),
            ] else if (status == OrderStatus.inProgress)
              StatusMessageCard(
                icon: Icons.local_car_wash_rounded,
                title: 'track_washing_title'.tr,
                description: 'track_washing_desc'.tr,
              )
            else if (status == OrderStatus.pending ||
                status == OrderStatus.confirmed)
              StatusMessageCard(
                icon: Icons.location_searching_rounded,
                title: 'track_not_started_title'.tr,
                description: 'track_not_started_desc'.tr,
              )
            else
              StatusMessageCard(
                icon: Icons.location_off_rounded,
                title: 'track_unavailable_title'.tr,
                description: 'track_unavailable_desc'.tr,
              ),

            if (isLive) ...[
              const SizedBox(height: 24),
              FormLabel('track_technician'.tr),
              const SizedBox(height: 10),
              TechnicianCard(
                technician: controller.technician,
                onCall: controller.callTechnician,
                onChat: controller.chatTechnician,
              ),
              const SizedBox(height: 24),
              FormLabel('order_info'.tr),
              const SizedBox(height: 10),
              AppCard(
                child: Column(
                  children: [
                    IconLine(
                      icon: order.address.type.icon,
                      text: '${order.address.emirate.labelKey.tr} • '
                          '${order.address.area}',
                    ),
                    IconLine(
                      icon: order.car.type.icon,
                      text: '${order.car.title} • '
                          '\u2066${order.car.plateCode} ${order.car.plateNumber}\u2069',
                    ),
                    IconLine(
                      icon: order.category.icon,
                      text: order.serviceTitleKey.tr,
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      }),
    );
  }
}