import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// خمس نجوم. بدون onChanged = للعرض فقط.
class StarRating extends StatelessWidget {
  final int value;
  final ValueChanged<int>? onChanged;
  final double size;

  const StarRating({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (i) {
          final filled = i < value;
          final star = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              filled ? Icons.star_rounded : Icons.star_outline_rounded,
              size: size,
              color: filled
                  ? const Color(0xFFFFB400)
                  : darkNavy.withValues(alpha: 0.25),
            ),
          );

          if (onChanged == null) return star;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onChanged!(i + 1),
            child: star,
          );
        }),
      ),
    );
  }
}