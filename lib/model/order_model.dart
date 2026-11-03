import 'address_model.dart';
import 'booking_draft.dart';
import 'car_model.dart';
import 'payment_method.dart';
import 'wash_service_model.dart';

enum OrderStatus { pending, confirmed, onTheWay, inProgress, completed, cancelled }

extension OrderStatusX on OrderStatus {
  /// مفتاح الترجمة: order_status_pending ...
  String get labelKey => 'order_status_$name';

  /// الطلب ما زال جارياً (غير مكتمل ولا ملغي)
  bool get isActive =>
      this != OrderStatus.completed && this != OrderStatus.cancelled;
}

/// لقطة من الإضافة وقت الطلب (حتى لا يتغير الطلب القديم لو تغيّر السعر لاحقاً).
class OrderAddOn {
  final String id;
  final String titleKey;
  final double price;

  const OrderAddOn({
    required this.id,
    required this.titleKey,
    required this.price,
  });

  factory OrderAddOn.fromJson(Map<String, dynamic> json) => OrderAddOn(
        id: json['id'] as String,
        titleKey: json['title_key'] as String,
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() =>
      {'id': id, 'title_key': titleKey, 'price': price};
}

class OrderModel {
  final String id;
  final ServiceCategory category;
  final List<OrderAddOn> addOns;
  final CarModel car;
  final AddressModel address;
  final DateTime? scheduledStart; // null = في أقرب وقت
  final PaymentMethod paymentMethod;
  final double servicePrice;
  final double addOnsTotal;
  final double discount;
  final double total;
  final String? promoCode;
  final OrderStatus status;
  final DateTime createdAt;

  /// تقييم العميل (1..5) وتعليقه. null = لم يُقيَّم بعد
  final int? rating;
  final String? review;

  /// صور الفني (روابط). لاحقاً: روابط Firebase Storage
  final List<String> beforePhotos;
  final List<String> afterPhotos;

  const OrderModel({
    required this.id,
    required this.category,
    required this.addOns,
    required this.car,
    required this.address,
    required this.scheduledStart,
    required this.paymentMethod,
    required this.servicePrice,
    required this.addOnsTotal,
    required this.discount,
    required this.total,
    required this.promoCode,
    required this.status,
    required this.createdAt,
    this.rating,
    this.review,
    this.beforePhotos = const [],
    this.afterPhotos = const [],
  });

  String get serviceTitleKey => 'service_${category.name}';

  /// إنشاء طلب جديد من المسودة بعد التأكيد
  factory OrderModel.fromDraft({
    required BookingDraft draft,
    required PaymentMethod paymentMethod,
    required double discount,
    String? promoCode,
  }) {
    final now = DateTime.now();
    return OrderModel(
      // لاحقاً: المعرّف يأتي من Firestore
      id: 'BQ-${now.millisecondsSinceEpoch % 1000000}',
      category: draft.service.category,
      addOns: draft.addOns
          .map((a) =>
              OrderAddOn(id: a.id, titleKey: a.titleKey, price: a.price))
          .toList(),
      car: draft.car,
      address: draft.address,
      scheduledStart: draft.scheduledStart,
      paymentMethod: paymentMethod,
      servicePrice: draft.servicePrice,
      addOnsTotal: draft.addOnsTotal,
      discount: discount,
      total: draft.subtotal - discount,
      promoCode: promoCode,
      status: OrderStatus.pending,
      createdAt: now,
    );
  }

  OrderModel copyWith({
    OrderStatus? status,
    int? rating,
    String? review,
    List<String>? beforePhotos,
    List<String>? afterPhotos,
  }) =>
      OrderModel(
        id: id,
        category: category,
        addOns: addOns,
        car: car,
        address: address,
        scheduledStart: scheduledStart,
        paymentMethod: paymentMethod,
        servicePrice: servicePrice,
        addOnsTotal: addOnsTotal,
        discount: discount,
        total: total,
        promoCode: promoCode,
        status: status ?? this.status,
        createdAt: createdAt,
        rating: rating ?? this.rating,
        review: review ?? this.review,
        beforePhotos: beforePhotos ?? this.beforePhotos,
        afterPhotos: afterPhotos ?? this.afterPhotos,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as String,
        category: ServiceCategory.values.byName(json['category'] as String),
        addOns: (json['add_ons'] as List)
            .map((e) =>
                OrderAddOn.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        car: CarModel.fromJson(Map<String, dynamic>.from(json['car'] as Map)),
        address: AddressModel.fromJson(
            Map<String, dynamic>.from(json['address'] as Map)),
        scheduledStart: json['scheduled_start'] == null
            ? null
            : DateTime.parse(json['scheduled_start'] as String),
        paymentMethod:
            PaymentMethod.values.byName(json['payment_method'] as String),
        servicePrice: (json['service_price'] as num).toDouble(),
        addOnsTotal: (json['add_ons_total'] as num).toDouble(),
        discount: (json['discount'] as num).toDouble(),
        total: (json['total'] as num).toDouble(),
        promoCode: json['promo_code'] as String?,
        status: OrderStatus.values.byName(json['status'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        rating: json['rating'] as int?,
        review: json['review'] as String?,
        beforePhotos: (json['before_photos'] as List? ?? [])
            .map((e) => e as String)
            .toList(),
        afterPhotos: (json['after_photos'] as List? ?? [])
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category.name,
        'add_ons': addOns.map((a) => a.toJson()).toList(),
        'car': car.toJson(),
        'address': address.toJson(),
        'scheduled_start': scheduledStart?.toIso8601String(),
        'payment_method': paymentMethod.name,
        'service_price': servicePrice,
        'add_ons_total': addOnsTotal,
        'discount': discount,
        'total': total,
        'promo_code': promoCode,
        'status': status.name,
        'created_at': createdAt.toIso8601String(),
        'rating': rating,
        'review': review,
        'before_photos': beforePhotos,
        'after_photos': afterPhotos,
      };
}