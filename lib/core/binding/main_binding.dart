import 'package:bariq/controller/app/addresses_controller.dart';
import 'package:bariq/controller/app/cars_controller.dart';
import 'package:bariq/controller/app/main_controller.dart';
import 'package:bariq/controller/app/notifications_controller.dart';
import 'package:bariq/controller/app/offers_controller.dart';
import 'package:bariq/controller/app/orders_controller.dart';
import 'package:bariq/controller/app/profile_controller.dart';
import 'package:bariq/controller/app/subscriptions_controller.dart';
import 'package:get/get.dart';

import 'home_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<OffersController>(() => OffersController());
    // تُستخدم من صفحات فرعية فتحتاج fenix: true
    Get.lazyPut<CarsController>(() => CarsController(), fenix: true);
    Get.lazyPut<AddressesController>(() => AddressesController(), fenix: true);
    Get.lazyPut<OrdersController>(() => OrdersController(), fenix: true);
    Get.lazyPut<SubscriptionsController>(
      () => SubscriptionsController(),
      fenix: true,
    );
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
      fenix: true,
    );
    HomeBinding().dependencies();
  }
}
