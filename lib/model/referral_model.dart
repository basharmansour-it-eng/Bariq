enum ReferralStatus { pending, rewarded }

/// صديق سجّل بكود المستخدم.
class ReferralFriend {
  final String id;
  final String name;
  final DateTime joinedAt;
  final ReferralStatus status;

  const ReferralFriend({
    required this.id,
    required this.name,
    required this.joinedAt,
    this.status = ReferralStatus.pending,
  });

  ReferralFriend copyWith({ReferralStatus? status}) => ReferralFriend(
        id: id,
        name: name,
        joinedAt: joinedAt,
        status: status ?? this.status,
      );

  factory ReferralFriend.fromJson(Map<String, dynamic> json) => ReferralFriend(
        id: json['id'] as String,
        name: json['name'] as String,
        joinedAt: DateTime.parse(json['joinedAt'] as String),
        status: ReferralStatus.values.byName(json['status'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'joinedAt': joinedAt.toIso8601String(),
        'status': status.name,
      };
}