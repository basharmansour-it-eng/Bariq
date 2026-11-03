import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/router/app_routes.dart';
import '../../model/car_model.dart';
import 'section_header.dart';
import 'selectable_tile.dart';

/// قسم «اختر السيارة»: قائمة اختيار + زر إضافة (وزر كبير إن كانت القائمة فارغة).
/// ضعه داخل Obx ومرّر قيماً تفاعلية: cars.toList() و selectedCarId.value.
class CarPicker extends StatelessWidget {
  final List<CarModel> cars;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  const CarPicker({
    super.key,
    required this.cars,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'booking_choose_car'.tr,
          actionText: 'add_new'.tr,
          onAction: () => Get.toNamed(Routes.addCar),
        ),
        const SizedBox(height: 10),
        if (cars.isEmpty)
          OutlinedButton.icon(
            onPressed: () => Get.toNamed(Routes.addCar),
            icon: const Icon(Icons.add_rounded),
            label: Text('add_car'.tr),
          )
        else
          for (final car in cars)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SelectableTile(
                icon: car.type.icon,
                title: car.title,
                subtitle: '${car.type.labelKey.tr} • '
                    '${car.plateEmirate.labelKey.tr} '
                    '\u2066${car.plateCode} ${car.plateNumber}\u2069',
                selected: selectedId == car.id,
                onTap: () => onSelect(car.id),
              ),
            ),
      ],
    );
  }
}