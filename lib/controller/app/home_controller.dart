import 'package:bariq/model/wash_service_model.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final currentTab = 0.obs;

  // بيانات تجريبية؛ ستأتي لاحقاً من الـ API / قاعدة البيانات.
  final services = const <WashService>[
    WashService(
        id: '1',
        category: ServiceCategory.exterior,
        fromPrice: 35,
        durationMinutes: 30),
    WashService(
        id: '2',
        category: ServiceCategory.interior,
        fromPrice: 40,
        durationMinutes: 40),
    WashService(
        id: '3',
        category: ServiceCategory.full,
        fromPrice: 60,
        durationMinutes: 60),
    WashService(
        id: '4',
        category: ServiceCategory.waterless,
        fromPrice: 30,
        durationMinutes: 25),
    WashService(
        id: '5',
        category: ServiceCategory.polish,
        fromPrice: 100,
        durationMinutes: 90),
    WashService(
        id: '6',
        category: ServiceCategory.ceramic,
        fromPrice: 500,
        durationMinutes: 240),
  ];

  void changeTab(int index) => currentTab.value = index;

  void onBookNow() {
    // لاحقاً: الانتقال إلى شاشة اختيار الخدمة والموقع
    Get.snackbar('book_now'.tr, 'loading'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  void onSchedule() {
    // لاحقاً: شاشة اختيار الوقت
  }
}
