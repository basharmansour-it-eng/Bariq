import 'dart:async';
import 'dart:math';

import 'package:bariq/model/order_model.dart';
import 'package:bariq/model/technician_model.dart';
import 'package:get/get.dart';

import 'orders_controller.dart';

class TrackingController extends GetxController {
  late final String orderId;
  final _orders = Get.find<OrdersController>();

  /// لاحقاً: الفني ورقم هاتفه من الطلب في Firestore
  final technician = sampleTechnician;

  /// الوقت المتوقع عند الانطلاق (دقائق)
  static const initialEtaMinutes = 12;

  // مؤقت: مدة المحاكاة بالثواني
  static const _demoSeconds = 60;

  /// 0 = انطلق الفني، 1 = وصل
  /// لاحقاً: يُحسب من موقع الفني الحقيقي (Firestore/Realtime Database)
  final progress = 0.0.obs;

  Timer? _timer;

  OrderModel? get order => _orders.orderById(orderId);

  int get etaMinutes => ((1 - progress.value) * initialEtaMinutes).ceil();

  bool get arrived => progress.value >= 1;

  @override
  void onInit() {
    super.onInit();
    orderId = Get.arguments as String;
    _startDemo();
  }

  // ───────── مؤقت: محاكاة حركة الفني ─────────
  void _startDemo() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      progress.value = min(1.0, progress.value + 1 / _demoSeconds);
      if (progress.value >= 1) t.cancel();
    });
  }

  void restartDemo() {
    progress.value = 0;
    _startDemo();
  }

  // لاحقاً: url_launcher للاتصال، وشاشة محادثة حقيقية
  void callTechnician() => _soon();
  void chatTechnician() => _soon();

  void _soon() {
    Get.snackbar('app_name'.tr, 'track_action_soon'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}