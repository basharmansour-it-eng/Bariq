import 'package:bariq/core/constant/storage_keys.dart';
import 'package:bariq/model/address_model.dart';
import 'package:bariq/model/emirate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AddressesController extends GetxController {
  final _box = GetStorage();

  final addresses = <AddressModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  // لاحقاً: تُقرأ من Firestore (users/{uid}/addresses)
  void _load() {
    final raw = _box.read<List>(StorageKeys.addresses) ?? [];
    addresses.assignAll(
      raw.map(
          (e) => AddressModel.fromJson(Map<String, dynamic>.from(e as Map))),
    );
  }

  void _save() {
    _box.write(
        StorageKeys.addresses, addresses.map((a) => a.toJson()).toList());
  }

  /// العنوان الافتراضي (يُستخدم لاحقاً في الحجز السريع)
  AddressModel? get defaultAddress =>
      addresses.firstWhereOrNull((a) => a.isDefault);

  void addAddress(AddressModel address) {
    // أول عنوان يصبح افتراضياً تلقائياً
    addresses.add(addresses.isEmpty ? address.copyWith(isDefault: true) : address);
    _save();
  }

  void setDefault(String id) {
    final updated = addresses
        .map((a) => a.copyWith(isDefault: a.id == id))
        .toList()
      ..sort((a, b) => (b.isDefault ? 1 : 0).compareTo(a.isDefault ? 1 : 0));
    addresses.assignAll(updated);
    _save();
  }

  void deleteAddress(String id) {
    final removed = addresses.firstWhereOrNull((a) => a.id == id);
    addresses.removeWhere((a) => a.id == id);
    if (removed != null && removed.isDefault && addresses.isNotEmpty) {
      addresses[0] = addresses[0].copyWith(isDefault: true);
    }
    _save();
  }

  // ───────── مؤقت: يُحذف عند بناء صفحة إضافة عنوان ─────────
  int _sampleIndex = 0;

  static const _samples = <AddressModel>[
    AddressModel(
      id: '',
      type: AddressType.home,
      emirate: Emirate.dubai,
      area: 'Dubai Marina',
      building: 'Marina Tower',
      details: 'Apt 502 • Parking B2',
    ),
    AddressModel(
      id: '',
      type: AddressType.work,
      emirate: Emirate.dubai,
      area: 'Business Bay',
      building: 'Bay Square',
      details: 'Visitor parking',
    ),
    AddressModel(
      id: '',
      type: AddressType.other,
      emirate: Emirate.abuDhabi,
      area: 'Al Reem Island',
      building: 'Sun Tower',
      details: 'Level P1',
    ),
  ];

  void addSampleAddress() {
    final sample = _samples[_sampleIndex++ % _samples.length];
    addAddress(
        sample.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString()));
  }
}