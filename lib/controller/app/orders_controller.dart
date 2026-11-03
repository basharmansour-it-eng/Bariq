import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/order_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'main_controller.dart';

class OrdersController extends GetxController {
  final _box = GetStorage();

  final orders = <OrderModel>[].obs;

  /// 0 = الحالية، 1 = السابقة
  final tabIndex = 0.obs;

  List<OrderModel> get activeOrders =>
      orders.where((o) => o.status.isActive).toList();

  List<OrderModel> get pastOrders =>
      orders.where((o) => !o.status.isActive).toList();

  List<OrderModel> get visibleOrders =>
      tabIndex.value == 0 ? activeOrders : pastOrders;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  // لاحقاً: تُقرأ من Firestore (orders حيث userId == uid) بتحديث لحظي
  void _load() {
    final raw = _box.read<List>(StorageKeys.orders) ?? [];
    orders.assignAll(
      raw.map((e) => OrderModel.fromJson(Map<String, dynamic>.from(e as Map))),
    );
  }

  void _save() {
    _box.write(StorageKeys.orders, orders.map((o) => o.toJson()).toList());
  }

  /// الأحدث أولاً
  void addOrder(OrderModel order) {
    orders.insert(0, order);
    _save();
  }

  /// من الحالة الفارغة: الانتقال إلى الرئيسية للحجز
  void goBook() => Get.find<MainController>().changeTab(0);

OrderModel? orderById(String id) => orders.firstWhereOrNull((o) => o.id == id);

void cancelOrder(String id) {
  final i = orders.indexWhere((o) => o.id == id);
  if (i == -1) return;
  orders[i] = orders[i].copyWith(status: OrderStatus.cancelled);
  _save();
}

void rateOrder(String id, int rating, String? review) {
  final i = orders.indexWhere((o) => o.id == id);
  if (i == -1) return;
  orders[i] = orders[i].copyWith(rating: rating, review: review);
  _save();
}

void setPhotos(String id,
    {required List<String> before, required List<String> after}) {
  final i = orders.indexWhere((o) => o.id == id);
  if (i == -1) return;
  orders[i] = orders[i].copyWith(beforePhotos: before, afterPhotos: after);
  _save();
}

void openOrder(OrderModel order) {
  Get.toNamed(Routes.orderDetails, arguments: order.id);
}

  // ───────── مؤقت: يُحذف عند بناء التفاصيل والتتبع ─────────
  void advanceStatus(String id) {
    final i = orders.indexWhere((o) => o.id == id);
    if (i == -1) return;
    final next = OrderStatus
        .values[(orders[i].status.index + 1) % OrderStatus.values.length];
    orders[i] = orders[i].copyWith(status: next);
    _save();
  }
}