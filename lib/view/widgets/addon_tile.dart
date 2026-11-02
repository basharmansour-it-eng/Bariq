import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/addon_model.dart';

/// صف إضافة اختيارية قابل للتحديد.
class AddOnTile extends StatelessWidget {
  final AddOn addOn;
  final bool selected;
  final VoidCallback onTap;

  const AddOnTile({
    super.key,
    required this.addOn,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: selected ? primaryBlue : Colors.transparent,
          width: 1.4,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightCyan.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(addOn.icon, size: 22, color: primaryBlue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  addOn.titleKey.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontWeight: FontWeight.w700,
                    color: darkNavy,
                  ),
                ),
              ),
              Text(
                'addon_price'
                    .trParams({'price': addOn.price.toStringAsFixed(0)}),
                style: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w700,
                  color: darkNavy.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(width: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? primaryBlue : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? primaryBlue
                        : darkNavy.withValues(alpha: 0.25),
                    width: 1.6,
                  ),
                ),
                child: selected
                    ? const Icon(Icons.check_rounded,
                        size: 16, color: whiteColor)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}