import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/emirate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/address_model.dart';

/// بطاقة عنوان واحد في قائمة العناوين المحفوظة.
class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onSetDefault;
  final VoidCallback onDelete;

  const AddressCard({
    super.key,
    required this.address,
    required this.onSetDefault,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: address.isDefault
            ? Border.all(color: primaryBlue.withValues(alpha: 0.5), width: 1.4)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: lightCyan.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(address.type.icon, color: primaryBlue, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        address.type.labelKey.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: cairo,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: darkNavy,
                        ),
                      ),
                    ),
                    if (address.isDefault) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: primaryBlue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'address_default'.tr,
                          style: TextStyle(
                            fontFamily: cairo,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${address.emirate.labelKey.tr} • ${address.area}',
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 13,
                    color: darkNavy.withValues(alpha: 0.7),
                  ),
                ),
                if (address.fullDetails.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    address.fullDetails,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 12,
                      color: darkNavy.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert_rounded,
                color: darkNavy.withValues(alpha: 0.5)),
            color: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            onSelected: (value) {
              if (value == 'default') onSetDefault();
              if (value == 'delete') onDelete();
            },
            itemBuilder: (_) => [
              if (!address.isDefault)
                PopupMenuItem(
                  value: 'default',
                  child: Text('set_default'.tr),
                ),
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  'delete'.tr,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}