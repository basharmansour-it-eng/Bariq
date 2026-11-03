import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/booking_args.dart';
import 'package:bariq/model/booking_draft.dart';
import 'package:bariq/model/car_model.dart';
import 'package:get/get.dart';

import 'addresses_controller.dart';
import 'cars_controller.dart';

class BookingController extends GetxController {
  /// بداية كل فترة (ساعتان): 08:00-10:00 ... 20:00-22:00
  static const slotHours = [8, 10, 12, 14, 16, 18, 20];
  static const _workStartHour = 8;
  static const _workEndHour = 22;
  static const _daysAhead = 7;

  late final BookingArgs args;
  final _cars = Get.find<CarsController>();
  final _addresses = Get.find<AddressesController>();

  late final List<DateTime> days;
  late final bool canBookNow;

  final selectedCarId = RxnString();
  final selectedAddressId = RxnString();
  final isScheduled = false.obs;
  final selectedDayIndex = 0.obs;
  final selectedSlotHour = RxnInt();

  RxList<CarModel> get cars => _cars.cars;
  RxList<AddressModel> get addresses => _addresses.addresses;

  CarModel? get selectedCar =>
      cars.firstWhereOrNull((c) => c.id == selectedCarId.value);

  AddressModel? get selectedAddress =>
      addresses.firstWhereOrNull((a) => a.id == selectedAddressId.value);

  /// السعر يتبع نوع السيارة المختارة (وإن لم تُختر بعد، فنوع التقدير المبدئي)
  double get servicePrice =>
      args.service.priceFor(selectedCar?.type ?? args.carType);

  double get total => servicePrice + args.addOnsTotal;

  bool get canContinue =>
      selectedCar != null &&
      selectedAddress != null &&
      (!isScheduled.value || selectedSlotHour.value != null);

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as BookingArgs;

    // ملاحظة: نعتمد وقت الجهاز الآن. لاحقاً يُفضَّل وقت الخادم بتوقيت الإمارات.
    final now = DateTime.now();
    days = List.generate(
      _daysAhead,
      (i) => DateTime(now.year, now.month, now.day + i),
    );

    // الحجز الفوري متاح داخل ساعات العمل وقبل نهايتها بساعة على الأقل
    canBookNow = now.hour >= _workStartHour && now.hour < _workEndHour - 1;
    isScheduled.value = !canBookNow;

    // نبدأ بأول يوم فيه فترة متاحة
    final firstDay = days.indexWhere(
      (d) => slotHours.any((h) => _isAvailable(d, h)),
    );
    selectedDayIndex.value = firstDay == -1 ? 0 : firstDay;

    _ensureSelections();
    // لو أضاف المستخدم سيارة أو عنواناً من هذه الصفحة نحدّث الاختيار
    ever(_cars.cars, (_) => _ensureSelections());
    ever(_addresses.addresses, (_) => _ensureSelections());
  }

  /// يختار الافتراضي (أو الأول) إذا لم يكن هناك اختيار صالح
  void _ensureSelections() {
    if (selectedCar == null) {
      selectedCarId.value = _cars.defaultCar?.id ??
          (cars.isNotEmpty ? cars.first.id : null);
    }
    if (selectedAddress == null) {
      selectedAddressId.value = _addresses.defaultAddress?.id ??
          (addresses.isNotEmpty ? addresses.first.id : null);
    }
  }

  bool _isAvailable(DateTime day, int hour) {
    final start = DateTime(day.year, day.month, day.day, hour);
    // نشترط أن تبدأ الفترة بعد ساعة من الآن على الأقل
    return start.isAfter(DateTime.now().add(const Duration(hours: 1)));
  }

  bool isAvailableOn(int dayIndex, int hour) =>
      _isAvailable(days[dayIndex], hour);

  void selectDay(int index) {
    selectedDayIndex.value = index;
    final hour = selectedSlotHour.value;
    if (hour != null && !isAvailableOn(index, hour)) {
      selectedSlotHour.value = null;
    }
  }

void continueToReview() {
  if (!canContinue) return;

  DateTime? start;
  if (isScheduled.value) {
    final day = days[selectedDayIndex.value];
    start = DateTime(day.year, day.month, day.day, selectedSlotHour.value!);
  }

  Get.toNamed(
    Routes.checkout,
    arguments: BookingDraft(
      service: args.service,
      addOns: args.addOns,
      car: selectedCar!,
      address: selectedAddress!,
      scheduledStart: start,
    ),
  );
}
}