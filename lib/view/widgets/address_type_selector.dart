import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/address_model.dart';

/// اختيار نوع العنوان: منزل / عمل / آخر (ثلاث بطاقات متساوية العرض).
class AddressTypeSelector extends StatelessWidget {
  final AddressType selected;
  final ValueChanged<AddressType> onChanged;

  const AddressTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final types = AddressType.values;

    return Row(
      children: [
        for (var i = 0; i < types.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(child: _TypeCard(
            type: types[i],
            isSelected: types[i] == selected,
            onTap: () => onChanged(types[i]),
          )),
        ],
      ],
    );
  }
}

class _TypeCard extends StatelessWidget {
  final AddressType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeCard({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? primaryBlue : whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: isSelected ? primaryBlue : lightCyan.withValues(alpha: 0.6),
          width: 1.4,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(
                type.icon,
                size: 26,
                color: isSelected ? whiteColor : primaryBlue,
              ),
              const SizedBox(height: 6),
              Text(
                type.labelKey.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? whiteColor : darkNavy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}