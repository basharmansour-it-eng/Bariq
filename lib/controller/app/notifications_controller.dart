import 'package:bariq/controller/app/main_controller.dart';
import 'package:bariq/controller/app/orders_controller.dart';
import 'package:bariq/controller/app/subscriptions_controller.dart';
import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/notification_model.dart';
import 'package:bariq/model/order_model.dart';
import 'package:bariq/model/subscription_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationsController extends GetxController {
  final _box = GetStorage();
  final _orders = Get.find<OrdersController>();
  final _subs = Get.find<SubscriptionsController>();

  static const _maxItems = 50;

  final items = <NotificationModel>[].obs;

  int get unreadCount => items.where((n) => !n.isRead).length;

  // آخر حالة معروفة لكل طلب/اشتراك لنكتشف التغيّر
  final _knownOrders = <String, OrderStatus>{};
  final _knownSubs = <String>{};
  int _counter = 0;

  @override
  void onInit() {
    super.onInit();
    _load();
    _seedWelcome();

    for (final o in _orders.orders) {
      _knownOrders[o.id] = o.status;
    }
    for (final s in _subs.subscriptions) {
      _knownSubs.add(s.id);
    }

    // لاحقاً: تصل الإشعارات من FCM وتُحفظ في Firestore، ويُحذف هذان المراقبان
    ever(_orders.orders, _onOrdersChanged);
    ever(_subs.subscriptions, _onSubscriptionsChanged);
  }

  // ───────── التخزين ─────────
  void _load() {
    final raw = _box.read<List>(StorageKeys.notifications) ?? [];
    items.assignAll(
      raw.map((e) =>
          NotificationModel.fromJson(Map<String, dynamic>.from(e as Map))),
    );
  }

  void _save() {
    _box.write(
        StorageKeys.notifications, items.map((n) => n.toJson()).toList());
  }

  void _add({
    required NotificationType type,
    required String titleKey,
    required String bodyKey,
    Map<String, String> params = const {},
    String? route,
    String? routeArgs,
  }) {
    items.insert(
      0,
      NotificationModel(
        id: '${DateTime.now().microsecondsSinceEpoch}-${_counter++}',
        type: type,
        titleKey: titleKey,
        bodyKey: bodyKey,
        params: params,
        createdAt: DateTime.now(),
        route: route,
        routeArgs: routeArgs,
      ),
    );
    if (items.length > _maxItems) {
      items.assignAll(items.take(_maxItems).toList());
    }
    _save();
  }

  // ───────── مراقبة الطلبات والاشتراكات ─────────
  void _onOrdersChanged(List<OrderModel> list) {
    for (final o in list) {
      final previous = _knownOrders[o.id];
      if (previous == o.status) continue;

      _knownOrders[o.id] = o.status;
      _add(
        type: NotificationType.order,
        titleKey: 'notif_order_${o.status.name}_t',
        bodyKey: 'notif_order_${o.status.name}_b',
        params: {'id': '\u2066${o.id}\u2069'},
        route: Routes.orderDetails,
        routeArgs: o.id,
      );
    }
  }

  void _onSubscriptionsChanged(List<SubscriptionModel> list) {
    for (final s in list) {
      if (_knownSubs.contains(s.id)) continue;

      _knownSubs.add(s.id);
      _add(
        type: NotificationType.subscription,
        titleKey: 'notif_sub_t',
        bodyKey: 'notif_sub_b',
        route: Routes.subscriptions,
      );
    }
  }

  // ───────── مؤقت: إشعارات ترحيبية تظهر مرة واحدة ─────────
  // لاحقاً: تُرسل من الخادم (Cloud Function) عند إنشاء الحساب
  void _seedWelcome() {
    if (_box.read<bool>(StorageKeys.notificationsSeeded) ?? false) return;
    _box.write(StorageKeys.notificationsSeeded, true);

    _add(
      type: NotificationType.offer,
      titleKey: 'notif_invite_t',
      bodyKey: 'notif_invite_b',
      route: Routes.referrals,
    );
    _add(
      type: NotificationType.offer,
      titleKey: 'notif_welcome_t',
      bodyKey: 'notif_welcome_b',
    );
  }

  // ───────── الإجراءات ─────────
  void markRead(String id) {
    final i = items.indexWhere((n) => n.id == id);
    if (i == -1 || items[i].isRead) return;
    items[i] = items[i].copyWith(isRead: true);
    _save();
  }

  void markAllRead() {
    if (unreadCount == 0) return;
    items.assignAll(items.map((n) => n.copyWith(isRead: true)).toList());
    _save();
  }

  void remove(String id) {
    items.removeWhere((n) => n.id == id);
    _save();
  }

  void open(NotificationModel n) {
    markRead(n.id);

    if (n.route != null) {
      Get.toNamed(n.route!, arguments: n.routeArgs);
    } else if (n.type == NotificationType.offer) {
      // عرض بلا صفحة محددة: نذهب إلى تبويب العروض
      Get.until((route) => route.settings.name == Routes.home);
      Get.find<MainController>().changeTab(2);
    }
  }
}