import 'addon_model.dart';
import 'address_model.dart';
import 'car_model.dart';
import 'wash_service_model.dart';

/// مسودة الحجز بعد اكتمال اختيارات المستخدم، وقبل التأكيد والدفع.
class BookingDraft {
  /// طول الفترة الزمنية للموعد المجدول (بالساعات)
  static const windowHours = 2;

  final WashService service;
  final List<AddOn> addOns;
  final CarModel car;
  final AddressModel address;

  /// بداية الفترة المجدولة، أو null إذا كان الطلب «الآن»
  final DateTime? scheduledStart;

  const BookingDraft({
    required this.service,
    required this.addOns,
    required this.car,
    required this.address,
    required this.scheduledStart,
  });

  bool get isNow => scheduledStart == null;

  double get servicePrice => service.priceFor(car.type);

  double get addOnsTotal => addOns.fold<double>(0, (sum, a) => sum + a.price);

  double get subtotal => servicePrice + addOnsTotal;
}