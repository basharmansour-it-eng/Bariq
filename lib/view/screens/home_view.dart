// import 'package:bariq/controller/app/home_controller.dart';
// import 'package:bariq/core/constant/const.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../widgets/hero_card.dart';
// import '../widgets/language_button.dart';
// import '../widgets/service_card.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
//           children: [
//             const _Header(),
//             const SizedBox(height: 20),
//             HeroCard(
//               onBookNow: controller.onBookNow,
//               onSchedule: controller.onSchedule,
//             ),
//             const SizedBox(height: 28),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'our_services'.tr,
//                   style: TextStyle(
//                     fontFamily: cairo,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w800,
//                     color: darkNavy,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('see_all'.tr),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: controller.services.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 14,
//                 crossAxisSpacing: 14,
//                 childAspectRatio: 1.15,
//               ),
//               itemBuilder: (_, i) {
//                 final service = controller.services[i];
//                 return ServiceCard(
//                   service: service,
//                   onTap: () => controller.openService(service),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _Header extends StatelessWidget {
//   const _Header();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'hello'.tr,
//                 style: TextStyle(
//                   fontFamily: cairo,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w800,
//                   color: darkNavy,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 'home_subtitle'.tr,
//                 style: TextStyle(
//                   fontFamily: cairo,
//                   fontSize: 14,
//                   color: darkNavy.withValues(alpha: 0.65),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const LanguageButton(),
//       ],
//     );
//   }
// }
import 'package:bariq/controller/app/home_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/language_button.dart';
import '../widgets/service_card.dart';

/// لون التمييز (يمكنك تغييره ليناسب هوية التطبيق)
const Color _accent = Color(0xFFFFB703);

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [darkNavy.withValues(alpha: 0.07), Colors.grey.shade100],
            stops: const [0, 0.45],
          ),
        ),
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            children: [
              const _Header(),
              const SizedBox(height: 22),
              _HeroBanner(
                onBookNow: controller.onBookNow,
                onSchedule: controller.onSchedule,
              ),
              const SizedBox(height: 30),
              _SectionTitle(title: 'our_services'.tr, onSeeAll: () {}),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (_, i) {
                  final service = controller.services[i];
                  return _FadeSlideIn(
                    index: i,
                    child: ServiceCard(
                      service: service,
                      onTap: () => controller.openService(service),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ───────────────────────── Header ─────────────────────────

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hello'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'home_subtitle'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  color: darkNavy.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: darkNavy.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const LanguageButton(),
        ),
      ],
    );
  }
}

// ───────────────────────── Hero ─────────────────────────

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({required this.onBookNow, required this.onSchedule});

  final VoidCallback onBookNow;
  final VoidCallback onSchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [darkNavy, Color.lerp(darkNavy, Colors.blue, 0.4)!],
        ),
        boxShadow: [
          BoxShadow(
            color: darkNavy.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            // دوائر زخرفية
            PositionedDirectional(
              top: -40,
              end: -30,
              child: _Circle(
                size: 150,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            PositionedDirectional(
              bottom: -50,
              start: -20,
              child: _Circle(size: 120, color: _accent.withValues(alpha: 0.18)),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.bolt_rounded,
                      color: _accent,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'home_subtitle'.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: onBookNow,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _accent,
                            foregroundColor: darkNavy,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'book_now'.tr, // عدّل المفتاح إذا كان مختلفًا
                            style: TextStyle(
                              fontFamily: cairo,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: OutlinedButton(
                          onPressed: onSchedule,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'schedule'.tr, // عدّل المفتاح إذا كان مختلفًا
                            style: TextStyle(
                              fontFamily: cairo,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

// ───────────────────────── Section title ─────────────────────────

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.onSeeAll});

  final String title;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 22,
          decoration: BoxDecoration(
            color: _accent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          style: TextButton.styleFrom(foregroundColor: darkNavy),
          child: Text(
            'see_all'.tr,
            style: TextStyle(fontFamily: cairo, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

// ───────────────────────── Animation ─────────────────────────

/// ظهور تدريجي مع انزلاق خفيف لكل عنصر في الشبكة
class _FadeSlideIn extends StatelessWidget {
  const _FadeSlideIn({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + index * 90),
      curve: Curves.easeOutCubic,
      builder: (_, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 24 * (1 - value)),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
