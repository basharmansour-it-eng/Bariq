import 'package:flutter/material.dart';

enum NotificationType { order, subscription, offer, system }

extension NotificationTypeX on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.order:
        return Icons.local_car_wash_rounded;
      case NotificationType.subscription:
        return Icons.autorenew_rounded;
      case NotificationType.offer:
        return Icons.local_offer_rounded;
      case NotificationType.system:
        return Icons.notifications_rounded;
    }
  }

  Color get color {
    switch (this) {
      case NotificationType.order:
        return const Color(0xFF0075E5);
      case NotificationType.subscription:
        return const Color(0xFF7B61FF);
      case NotificationType.offer:
        return const Color(0xFFFF9800);
      case NotificationType.system:
        return const Color(0xFF607D8B);
    }
  }
}

/// إشعار داخل التطبيق.
/// النص لا يُخزَّن، بل مفاتيح الترجمة + معاملاتها، فيظهر بلغة المستخدم الحالية.
class NotificationModel {
  final String id;
  final NotificationType type;
  final String titleKey;
  final String bodyKey;
  final Map<String, String> params;
  final DateTime createdAt;
  final bool isRead;

  /// الصفحة التي يفتحها الإشعار (null = لا صفحة محددة)
  final String? route;
  final String? routeArgs;

  const NotificationModel({
    required this.id,
    required this.type,
    required this.titleKey,
    required this.bodyKey,
    this.params = const {},
    required this.createdAt,
    this.isRead = false,
    this.route,
    this.routeArgs,
  });

  NotificationModel copyWith({bool? isRead}) => NotificationModel(
        id: id,
        type: type,
        titleKey: titleKey,
        bodyKey: bodyKey,
        params: params,
        createdAt: createdAt,
        isRead: isRead ?? this.isRead,
        route: route,
        routeArgs: routeArgs,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] as String,
        type: NotificationType.values.byName(json['type'] as String),
        titleKey: json['title_key'] as String,
        bodyKey: json['body_key'] as String,
        params: Map<String, String>.from(json['params'] as Map? ?? {}),
        createdAt: DateTime.parse(json['created_at'] as String),
        isRead: json['is_read'] as bool? ?? false,
        route: json['route'] as String?,
        routeArgs: json['route_args'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'title_key': titleKey,
        'body_key': bodyKey,
        'params': params,
        'created_at': createdAt.toIso8601String(),
        'is_read': isRead,
        'route': route,
        'route_args': routeArgs,
      };
}