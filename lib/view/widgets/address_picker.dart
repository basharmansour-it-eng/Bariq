import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/router/app_routes.dart';
import '../../model/address_model.dart';
import 'section_header.dart';
import 'selectable_tile.dart';

/// قسم «اختر العنوان». ضعه داخل Obx كما في CarPicker.
class AddressPicker extends StatelessWidget {
  final List<AddressModel> addresses;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  const AddressPicker({
    super.key,
    required this.addresses,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'booking_choose_address'.tr,
          actionText: 'add_new'.tr,
          onAction: () => Get.toNamed(Routes.addAddress),
        ),
        const SizedBox(height: 10),
        if (addresses.isEmpty)
          OutlinedButton.icon(
            onPressed: () => Get.toNamed(Routes.addAddress),
            icon: const Icon(Icons.add_rounded),
            label: Text('add_address'.tr),
          )
        else
          for (final a in addresses)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SelectableTile(
                icon: a.type.icon,
                title: a.type.labelKey.tr,
                subtitle: '${a.emirate.labelKey.tr} • ${a.area}',
                selected: selectedId == a.id,
                onTap: () => onSelect(a.id),
              ),
            ),
      ],
    );
  }
}