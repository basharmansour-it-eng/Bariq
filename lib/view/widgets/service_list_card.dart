import 'package:bariq/core/constant/const.dart';
import 'package:bariq/model/wash_service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// بطاقة خدمة عريضة لصفحة "كل الخدمات".
class ServiceListCard extends StatelessWidget {
  final WashService service;
  final VoidCallback onTap;

  const ServiceListCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  Widget _chip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: lightCyan.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: primaryBlue),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: darkNavy.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1DB954);
    final eco = service.isWaterless;

    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: darkNavy.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: eco
                          ? const [Color(0xFF1DB954), Color(0xFF7BDC9B)]
                          : const [primaryBlue, secondaryBlue],
                    ),
                  ),
                  child: Icon(service.icon, color: whiteColor, size: 30),
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
                              service.titleKey.tr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: darkNavy,
                              ),
                            ),
                          ),
                          if (eco) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: green.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.eco_rounded,
                                      size: 13, color: green),
                                  const SizedBox(width: 3),
                                  Text(
                                    'eco_badge'.tr,
                                    style: TextStyle(
                                      fontFamily: cairo,
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w700,
                                      color: green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.descKey.tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: cairo,
                          fontSize: 12.5,
                          height: 1.5,
                          color: darkNavy.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          _chip(
                            Icons.schedule_rounded,
                            'service_min'.trParams({
                              'min': '\u2066${service.durationMinutes}\u2069',
                            }),
                          ),
                          _chip(
                            Icons.checklist_rounded,
                            'service_includes_count'.trParams({
                              'count':
                                  '\u2066${service.includesKeys.length}\u2069',
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'from_price'.trParams({
                                'price': service.fromPrice.toStringAsFixed(0),
                              }),
                              style: TextStyle(
                                fontFamily: cairo,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: primaryBlue,
                              ),
                            ),
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryBlue.withValues(alpha: 0.1),
                            ),
                            child: const Icon(Icons.arrow_forward_rounded,
                                size: 18, color: primaryBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}