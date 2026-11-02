import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/model/car_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class CarsController extends GetxController {
  final _box = GetStorage();

  final cars = <CarModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  // لاحقاً: تُقرأ من Firestore (users/{uid}/cars)
  void _load() {
    final raw = _box.read<List>(StorageKeys.cars) ?? [];
    cars.assignAll(
      raw.map((e) => CarModel.fromJson(Map<String, dynamic>.from(e as Map))),
    );
  }

  void _save() {
    _box.write(StorageKeys.cars, cars.map((c) => c.toJson()).toList());
  }

  /// السيارة الافتراضية (تُستخدم لاحقاً في الحجز السريع)
  CarModel? get defaultCar => cars.firstWhereOrNull((c) => c.isDefault);

  void addCar(CarModel car) {
    // أول سيارة تصبح افتراضية تلقائياً
    cars.add(cars.isEmpty ? car.copyWith(isDefault: true) : car);
    _save();
  }

  void setDefault(String id) {
    final updated = cars
        .map((c) => c.copyWith(isDefault: c.id == id))
        .toList()
      ..sort((a, b) => (b.isDefault ? 1 : 0).compareTo(a.isDefault ? 1 : 0));
    cars.assignAll(updated);
    _save();
  }

  void deleteCar(String id) {
    final removed = cars.firstWhereOrNull((c) => c.id == id);
    cars.removeWhere((c) => c.id == id);
    // لو حذفنا الافتراضية، تصبح الأولى المتبقية افتراضية
    if (removed != null && removed.isDefault && cars.isNotEmpty) {
      cars[0] = cars[0].copyWith(isDefault: true);
    }
    _save();
  }

  // ───────── مؤقت: يُحذف عند بناء صفحة إضافة سيارة ─────────
  int _sampleIndex = 0;

  static const _samples = <CarModel>[
    CarModel(
      id: '',
      brand: 'Toyota',
      model: 'Camry',
      type: CarType.sedan,
      colorValue: 0xFFFFFFFF,
      plateEmirate: Emirate.dubai,
      plateCode: 'A',
      plateNumber: '12345',
    ),
    CarModel(
      id: '',
      brand: 'Nissan',
      model: 'Patrol',
      type: CarType.suv,
      colorValue: 0xFF1C1C1E,
      plateEmirate: Emirate.abuDhabi,
      plateCode: '12',
      plateNumber: '45678',
    ),
    CarModel(
      id: '',
      brand: 'Ford',
      model: 'F-150',
      type: CarType.pickup,
      colorValue: 0xFF8E8E93,
      plateEmirate: Emirate.sharjah,
      plateCode: 'B',
      plateNumber: '7788',
    ),
  ];

  void addSampleCar() {
    final sample = _samples[_sampleIndex++ % _samples.length];
    addCar(sample.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString()));
  }
}