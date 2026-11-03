import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/technician_model.dart';
import 'app_card.dart';

/// بطاقة الفني مع أزرار الاتصال والمحادثة.
class TechnicianCard extends StatelessWidget {
  final TechnicianModel technician;
  final VoidCallback onCall;
  final VoidCallback onChat;

  const TechnicianCard({
    super.key,
    required this.technician,
    required this.onCall,
    required this.onChat,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [primaryBlue, secondaryBlue]),
            ),
            child: const Icon(Icons.person_rounded, color: whiteColor, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  technician.name,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w800,
                    color: darkNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        size: 16, color: Color(0xFFFFB400)),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(
                        '\u2066${technician.rating}\u2069 • '
                        '${'track_washes'.trParams({
                              'count': technician.washesCount.toString()
                            })}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: cairo,
                          fontSize: 12.5,
                          color: darkNavy.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            onPressed: onChat,
            tooltip: 'track_chat'.tr,
            icon: const Icon(Icons.chat_bubble_outline_rounded),
          ),
          const SizedBox(width: 6),
          IconButton.filled(
            onPressed: onCall,
            tooltip: 'track_call'.tr,
            icon: const Icon(Icons.call_rounded),
          ),
        ],
      ),
    );
  }
}