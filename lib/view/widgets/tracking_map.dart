import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// خريطة تجريبية مرسومة بالكود: طريق ودبوس وجهة وفني يتحرك عليه.
/// لاحقاً: تُستبدل بـ google_maps_flutter ويبقى الـ API نفسه تقريباً (progress/الموقع).
class TrackingMap extends StatelessWidget {
  /// 0..1 على طول الطريق
  final double progress;

  const TrackingMap({super.key, required this.progress});

  static Path _route(Size s) => Path()
    ..moveTo(s.width * .12, s.height * .82)
    ..lineTo(s.width * .12, s.height * .58)
    ..lineTo(s.width * .48, s.height * .58)
    ..lineTo(s.width * .48, s.height * .28)
    ..lineTo(s.width * .84, s.height * .28);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 300,
        child: LayoutBuilder(
          builder: (context, c) {
            final size = Size(c.maxWidth, c.maxHeight);
            final route = _route(size);
            final metric = route.computeMetrics().first;
            final dest = metric.getTangentForOffset(metric.length)!.position;

            return TweenAnimationBuilder<double>(
              tween: Tween(end: progress),
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              builder: (context, p, _) {
                final pos =
                    metric.getTangentForOffset(metric.length * p)!.position;

                return Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _MapPainter(route: route, progress: p),
                      ),
                    ),
                    // الوجهة
                    Positioned(
                      left: dest.dx - 22,
                      top: dest.dy - 42,
                      child: const Icon(Icons.location_on_rounded,
                          color: Colors.redAccent, size: 44),
                    ),
                    // الفني
                    Positioned(
                      left: pos.dx - 22,
                      top: pos.dy - 22,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [primaryBlue, secondaryBlue],
                          ),
                          border: Border.all(color: whiteColor, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.directions_car_filled_rounded,
                            color: whiteColor, size: 22),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  final Path route;
  final double progress;

  _MapPainter({required this.route, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFFE9F1F9),
    );

    // حدائق
    final park = Paint()..color = const Color(0xFFD3EAD6);
    for (final r in [
      Rect.fromLTWH(w * .52, h * .62, w * .26, h * .13),
      Rect.fromLTWH(w * .14, h * .14, w * .28, h * .10),
      Rect.fromLTWH(w * .70, h * .46, w * .14, h * .18),
    ]) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(r, const Radius.circular(10)), park);
    }

    // شوارع
    final minor = Paint()
      ..color = whiteColor.withValues(alpha: 0.75)
      ..strokeWidth = 8;
    final major = Paint()
      ..color = whiteColor
      ..strokeWidth = 16;

    for (final x in [.30, .66]) {
      canvas.drawLine(Offset(w * x, 0), Offset(w * x, h), minor);
    }
    for (final y in [.12, .42, .70]) {
      canvas.drawLine(Offset(0, h * y), Offset(w, h * y), minor);
    }
    for (final x in [.12, .48, .84]) {
      canvas.drawLine(Offset(w * x, 0), Offset(w * x, h), major);
    }
    for (final y in [.28, .58, .82]) {
      canvas.drawLine(Offset(0, h * y), Offset(w, h * y), major);
    }

    // المسار كاملاً ثم الجزء المقطوع
    final metric = route.computeMetrics().first;
    final routePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(route, routePaint..color = primaryBlue.withValues(alpha: 0.25));
    canvas.drawPath(
      metric.extractPath(0, metric.length * progress),
      routePaint..color = primaryBlue,
    );
  }

  @override
  bool shouldRepaint(covariant _MapPainter old) =>
      old.progress != progress || old.route != route;
}