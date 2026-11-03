import 'package:bariq/core/functions/date_labels.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/payment_method.dart';
import 'package:bariq/model/subscription_model.dart';
import 'package:bariq/model/subscription_plan_model.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:get/get.dart';

import 'addresses_controller.dart';
import 'cars_controller.dart';
import 'offers_controller.dart';
import 'subscriptions_controller.dart';

class PlanDetailsController extends GetxController {
  late final SubscriptionPlan plan;
  late final WashService service;

  final _cars = Get.find<CarsController>();
  final _addresses = Get.find<AddressesController>();
  final _subscriptions = Get.find<SubscriptionsController>();

  final selectedCarId = RxnString();
  final selectedAddressId = RxnString();

  final preferredWeekday = 1.obs;
  final preferredHour = 10.obs;

  final renewalMode = RenewalMode.auto.obs;
  late final paymentMethod = Rx<PaymentMethod>(methods.first);

  final isLoading = false.obs;

  /// تاريخ أول تجديد: بعد شهر من اليوم
  final renewalDate = addOneMonth(DateTime.now());

  RxList<CarModel> get cars => _cars.cars;
  RxList<AddressModel> get addresses => _addresses.addresses;

  CarModel? get selectedCar =>
      cars.firstWhereOrNull((c) => c.id == selectedCarId.value);

  AddressModel? get selectedAddress =>
      addresses.firstWhereOrNull((a) => a.id == selectedAddressId.value);

  /// التجديد التلقائي يتطلب وسيلة قابلة للخصم المتكرر، فنستبعد النقد منه
  List<PaymentMethod> get methods {
    final all = availablePaymentMethods();
    return renewalMode.value == RenewalMode.auto
        ? all.where((m) => m != PaymentMethod.cash).toList()
        : all;
  }

  double get unitPrice =>
      service.priceFor(selectedCar?.type ?? CarType.sedan);

  double get regularPrice => plan.regularPrice(unitPrice);

  double get monthlyPrice => plan.discountedPrice(unitPrice);

  double get saving => regularPrice - monthlyPrice;

  bool get canSubscribe => selectedCar != null && selectedAddress != null;

  @override
  void onInit() {
    super.onInit();
    plan = Get.arguments as SubscriptionPlan;
    // الباقة لا تُعرض أصلاً إلا إن وُجدت خدمتها
    service = Get.find<OffersController>().serviceFor(plan)!;

    // نبدأ بيوم الغد كيوم مفضل
    preferredWeekday.value = DateTime.now().add(const Duration(days: 1)).weekday;

    _ensureSelections();
    ever(_cars.cars, (_) => _ensureSelections());
    ever(_addresses.addresses, (_) => _ensureSelections());
  }

  void _ensureSelections() {
    if (selectedCar == null) {
      selectedCarId.value =
          _cars.defaultCar?.id ?? (cars.isNotEmpty ? cars.first.id : null);
    }
    if (selectedAddress == null) {
      selectedAddressId.value = _addresses.defaultAddress?.id ??
          (addresses.isNotEmpty ? addresses.first.id : null);
    }
  }

  void setRenewalMode(RenewalMode mode) {
    renewalMode.value = mode;
    // لو كانت الوسيلة المختارة لا تناسب الوضع الجديد نرجع لأول وسيلة متاحة
    if (!methods.contains(paymentMethod.value)) {
      paymentMethod.value = methods.first;
    }
  }

  Future<void> subscribe() async {
    if (!canSubscribe || isLoading.value) return;
    isLoading.value = true;

    // لاحقاً: Cloud Function تنفّذ الدفع الأول، وتحفظ وسيلة الدفع
    // للخصم المتكرر إن كان التجديد تلقائياً
    await Future.delayed(const Duration(milliseconds: 900));

    final now = DateTime.now();
    _subscriptions.addSubscription(
      SubscriptionModel(
        id: 'SUB-${now.millisecondsSinceEpoch % 1000000}',
        planId: plan.id,
        category: plan.category,
        washesPerMonth: plan.washesPerMonth,
        discountPercent: plan.discountPercent,
        monthlyPrice: monthlyPrice,
        car: selectedCar!,
        address: selectedAddress!,
        preferredWeekday: preferredWeekday.value,
        preferredHour: preferredHour.value,
        renewalMode: renewalMode.value,
        paymentMethod: paymentMethod.value,
        startDate: now,
        renewalDate: renewalDate,
      ),
    );

    isLoading.value = false;
    Get.back();
    Get.snackbar('app_name'.tr, 'subscription_created'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }
}