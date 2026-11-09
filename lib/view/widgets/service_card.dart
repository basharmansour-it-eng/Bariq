import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// بطاقة خدمة واحدة في شبكة الخدمات.
class ServiceCard extends StatelessWidget {
  final WashService service;
  final VoidCallback? onTap;

  const ServiceCard({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: lightCyan.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(service.icon, color: primaryBlue, size: 24),
                  ),
                  const Spacer(),
                  if (service.isWaterless) const _EcoBadge(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.titleKey.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: darkNavy,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'from_price'.trParams({
                      'price': service.fromPrice.toStringAsFixed(0),
                    }),
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 12,
                      color: darkNavy.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EcoBadge extends StatelessWidget {
  const _EcoBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF1DB954).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.eco_rounded, size: 12, color: Color(0xFF1DB954)),
          const SizedBox(width: 3),
          Text(
            'eco_badge'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1DB954),
            ),
          ),
        ],
      ),
    );
  }
}
