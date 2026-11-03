class TechnicianModel {
  final String id;
  final String name;
  final double rating;
  final int washesCount;
  final String phone;

  const TechnicianModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.washesCount,
    required this.phone,
  });
}

/// مؤقت: لاحقاً بيانات الفني تأتي من Firestore عبر technicianId في الطلب.
const sampleTechnician = TechnicianModel(
  id: 'tech-1',
  name: 'أحمد خالد',
  rating: 4.9,
  washesCount: 312,
  phone: '+971500000000',
);