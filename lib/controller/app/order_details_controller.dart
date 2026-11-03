import 'package:bariq/core/constant/sample_photo.dart';
import 'package:bariq/core/functions/confirm_dialog.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'orders_controller.dart';

class OrderDetailsController extends GetxController {
  late final String orderId;
  final _orders = Get.find<OrdersController>();

  final isCancelling = false.obs;

  /// نقرأ الطلب من القائمة دائماً (لا نحمل نسخة) فيتحدّث عند تغيّر حالته
  OrderModel? get order => _orders.orderById(orderId);

  /// الإلغاء مسموح قبل انطلاق الفني فقط
  bool get canCancel {
    final status = order?.status;
    return status == OrderStatus.pending || status == OrderStatus.confirmed;
  }

  @override
  void onInit() {
    super.onInit();
    orderId = Get.arguments as String;
  }

  Future<void> cancel() async {
    if (!canCancel || isCancelling.value) return;

    final ok = await confirmDialog(
      title: 'cancel_order_title'.tr,
      message: 'cancel_order_confirm'.tr,
      confirmText: 'cancel_order'.tr,
      cancelText: 'keep_order'.tr,
    );
    if (!ok) return;

    isCancelling.value = true;
    // لاحقاً: Cloud Function تلغي الطلب وتعالج الاسترجاع إن كان مدفوعاً
    await Future.delayed(const Duration(milliseconds: 600));
    _orders.cancelOrder(orderId);
    isCancelling.value = false;

    Get.snackbar('app_name'.tr, 'order_cancelled'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  // ───── التقييم ─────
final draftRating = 0.obs;
final commentController = TextEditingController();
final isSubmittingRating = false.obs;

void setDraftRating(int value) => draftRating.value = value;

Future<void> submitRating() async {
  final o = order;
  if (o == null || o.status != OrderStatus.completed || o.rating != null) {
    return;
  }
  if (draftRating.value == 0 || isSubmittingRating.value) return;

  isSubmittingRating.value = true;
  // لاحقاً: Cloud Function تحفظ التقييم وتحدّث متوسط تقييم الفني
  await Future.delayed(const Duration(milliseconds: 500));

  final comment = commentController.text.trim();
  _orders.rateOrder(
      orderId, draftRating.value, comment.isEmpty ? null : comment);
  isSubmittingRating.value = false;

  FocusManager.instance.primaryFocus?.unfocus();
  Get.snackbar('app_name'.tr, 'rate_sent'.tr,
      snackPosition: SnackPosition.BOTTOM);
}

// ───── مؤقت: يُحذف عندما يرفع الفني الصور فعلياً ─────
void addSamplePhotos() {
  final o = order;
  if (o == null || o.status != OrderStatus.completed) return;
  if (o.beforePhotos.isNotEmpty) return;
  _orders.setPhotos(orderId, before: [kSamplePhoto], after: [kSamplePhoto]);
}

@override
void onClose() {
  commentController.dispose();
  super.onClose();
}

void openTracking() => Get.toNamed(Routes.tracking, arguments: orderId);
}