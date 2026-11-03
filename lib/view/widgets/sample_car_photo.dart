import 'dart:math';

import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// مؤقت: صورة تجريبية مرسومة بالكود (متسخة / نظيفة) حتى تتوفر صور حقيقية.
class SampleCarPhoto extends StatelessWidget {
  final bool clean;
  const SampleCarPhoto({super.key, required this.clean});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: clean
                  ? [lightCyan, secondaryBlue]
                  : const [Color(0xFFB59B7A), Color(0xFF8C7458)],
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.directions_car_filled_rounded,
            size: 120,
            color: clean ? whiteColor : const Color(0xFF5E5040),
          ),
        ),
        if (clean) ...[
          const Positioned(
            top: 34,
            right: 60,
            child: Icon(Icons.auto_awesome_rounded,
                color: whiteColor, size: 30),
          ),
          const Positioned(
            bottom: 34,
            left: 70,
            child: Icon(Icons.auto_awesome_rounded,
                color: whiteColor, size: 20),
          ),
        ] else
          Positioned.fill(child: CustomPaint(painter: _DirtPainter())),
      ],
    );
  }
}

class _DirtPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rnd = Random(7); // ثابت لتبقى البقع في نفس الأماكن
    final paint = Paint()..color = const Color(0xFF4A3B2A).withValues(alpha: 0.35);
    for (var i = 0; i < 45; i++) {
      canvas.drawCircle(
        Offset(rnd.nextDouble() * size.width, rnd.nextDouble() * size.height),
        2 + rnd.nextDouble() * 5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}