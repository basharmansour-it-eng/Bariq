import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// مقارنة قبل/بعد: اسحب الخط (أو المس أي مكان) لإظهار الصورتين.
/// الاتجاه ثابت من اليسار لليمين: "قبل" يساراً و"بعد" يميناً في كل اللغات.
class BeforeAfterSlider extends StatefulWidget {
  final Widget before;
  final Widget after;

  const BeforeAfterSlider({
    super.key,
    required this.before,
    required this.after,
  });

  @override
  State<BeforeAfterSlider> createState() => _BeforeAfterSliderState();
}

class _BeforeAfterSliderState extends State<BeforeAfterSlider> {
  double _pos = 0.5;

  void _move(double dx, double width) {
    setState(() => _pos = (dx / width).clamp(0.0, 1.0));
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: cairo,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 1.6,
          child: LayoutBuilder(
            builder: (context, c) {
              final w = c.maxWidth;
              final h = c.maxHeight;
              final x = w * _pos;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onHorizontalDragUpdate: (d) => _move(d.localPosition.dx, w),
                onTapDown: (d) => _move(d.localPosition.dx, w),
                child: Stack(
                  children: [
                    Positioned.fill(child: widget.after),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: x,
                      child: ClipRect(
                        child: OverflowBox(
                          alignment: Alignment.centerLeft,
                          minWidth: w,
                          maxWidth: w,
                          child: widget.before,
                        ),
                      ),
                    ),
                    if (_pos > 0.18)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: _tag('photo_before'.tr),
                      ),
                    if (_pos < 0.82)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: _tag('photo_after'.tr),
                      ),
                    Positioned(
                      left: x - 1.5,
                      top: 0,
                      bottom: 0,
                      child: Container(width: 3, color: whiteColor),
                    ),
                    Positioned(
                      left: x - 20,
                      top: h / 2 - 20,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.compare_arrows_rounded,
                          color: primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
