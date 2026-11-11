import 'package:bariq/core/constant/const.dart';
import 'package:bariq/core/functions/date_labels.dart';
import 'package:bariq/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// سطر إشعار: أيقونة النوع + العنوان + النص + الوقت. غير المقروء مميَّز.
class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final n = notification;
    final unread = !n.isRead;

    return Material(
      color: unread
          ? Color.alphaBlend(primaryBlue.withValues(alpha: 0.07), whiteColor)
          : whiteColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n.type.color.withValues(alpha: 0.12),
                ),
                child: Icon(n.type.icon, color: n.type.color, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            n.titleKey.tr,
                            style: TextStyle(
                              fontFamily: cairo,
                              fontSize: 14.5,
                              fontWeight:
                                  unread ? FontWeight.w800 : FontWeight.w600,
                              color: darkNavy,
                            ),
                          ),
                        ),
                        if (unread)
                          Container(
                            width: 9,
                            height: 9,
                            margin: const EdgeInsetsDirectional.only(start: 8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryBlue,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      n.bodyKey.trParams(n.params),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 12.5,
                        height: 1.5,
                        color: darkNavy.withValues(alpha: 0.65),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      timeAgoLabel(n.createdAt),
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 11.5,
                        color: darkNavy.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}