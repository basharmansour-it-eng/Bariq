import 'addon_model.dart';
import 'car_model.dart';
import 'wash_service_model.dart';

/// ما نمرّره من صفحة تفاصيل الخدمة إلى صفحة الحجز.
class BookingArgs {
  final WashService service;
  final List<AddOn> addOns;
  final CarType carType; // تقدير مبدئي، يتغير حسب السيارة المختارة

  const BookingArgs({
    required this.service,
    required this.addOns,
    required this.carType,
  });

  double get addOnsTotal => addOns.fold<double>(0, (sum, a) => sum + a.price);
}