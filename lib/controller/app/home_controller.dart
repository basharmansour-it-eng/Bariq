import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  // بيانات تجريبية؛ ستأتي لاحقاً من Firestore.
  // الأسعار قيم مبدئية بالدرهم، عدّلها كما تريد.
  final services = <WashService>[
    WashService(
      id: '1',
      category: ServiceCategory.exterior,
      durationMinutes: 30,
      prices: _prices(sedan: 35, suv: 45, pickup: 50),
    ),
    WashService(
      id: '2',
      category: ServiceCategory.interior,
      durationMinutes: 40,
      prices: _prices(sedan: 40, suv: 55, pickup: 60),
    ),
    WashService(
      id: '3',
      category: ServiceCategory.full,
      durationMinutes: 60,
      prices: _prices(sedan: 60, suv: 80, pickup: 90),
    ),
    WashService(
      id: '4',
      category: ServiceCategory.waterless,
      durationMinutes: 25,
      prices: _prices(sedan: 30, suv: 40, pickup: 45),
    ),
    WashService(
      id: '5',
      category: ServiceCategory.polish,
      durationMinutes: 90,
      prices: _prices(sedan: 100, coupe: 110, suv: 140, pickup: 150),
    ),
    WashService(
      id: '6',
      category: ServiceCategory.ceramic,
      durationMinutes: 240,
      prices: _prices(sedan: 500, coupe: 550, suv: 700, pickup: 750),
    ),
  ];

  /// الهاتشباك والكوبيه بسعر السيدان ما لم يُحدَّد غير ذلك
  static Map<CarType, double> _prices({
    required double sedan,
    required double suv,
    required double pickup,
    double? hatchback,
    double? coupe,
  }) =>
      {
        CarType.sedan: sedan,
        CarType.hatchback: hatchback ?? sedan,
        CarType.coupe: coupe ?? sedan,
        CarType.suv: suv,
        CarType.pickup: pickup,
      };

  void openService(WashService service) {
    Get.toNamed(Routes.serviceDetails, arguments: service);
  }

  void onBookNow() {
    // لاحقاً: الانتقال إلى رحلة الحجز السريع
    Get.snackbar('book_now'.tr, 'loading'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  void onSchedule() {
    // لاحقاً: شاشة اختيار الوقت
  }
}