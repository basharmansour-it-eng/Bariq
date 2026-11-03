import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';

import '../../core/constant/sample_photo.dart';
import 'sample_car_photo.dart';

/// صورة من صور الطلب. هذا هو المكان الوحيد الذي يعرف مصدر الصورة.
/// لاحقاً: روابط Firebase Storage، ويُحذف فرع kSamplePhoto.
class OrderPhoto extends StatelessWidget {
  final String source;
  final bool isAfter;

  const OrderPhoto({super.key, required this.source, required this.isAfter});

  @override
  Widget build(BuildContext context) {
    if (source == kSamplePhoto) return SampleCarPhoto(clean: isAfter);

    return Image.network(
      source,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : Container(
              color: lightCyan.withValues(alpha: 0.25),
              child: const Center(child: CircularProgressIndicator()),
            ),
      errorBuilder: (_, __, ___) => Container(
        color: lightCyan.withValues(alpha: 0.25),
        child: Icon(Icons.broken_image_outlined,
            color: darkNavy.withValues(alpha: 0.4)),
      ),
    );
  }
}