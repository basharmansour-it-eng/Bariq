// ignore_for_file: deprecated_member_use

import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/emirate.dart' show Emirate, EmirateX;
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// قائمة منسدلة لاختيار الإمارة (تُستخدم في لوحة السيارة، وفي العناوين لاحقاً).
class EmirateSelector extends StatelessWidget {
  final Emirate value;
  final ValueChanged<Emirate> onChanged;

  const EmirateSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Emirate>(
      value: value,
      isExpanded: true,
      dropdownColor: whiteColor,
      borderRadius: BorderRadius.circular(14),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.location_city_rounded),
      ),
      items: Emirate.values
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e.labelKey.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w600,
                  color: darkNavy,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (e) {
        if (e != null) onChanged(e);
      },
    );
  }
}