import 'package:bariq/controller/app/splash_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryBlue, deepBlue],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.7, end: 1),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutBack,
                builder: (_, value, child) => Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: Transform.scale(scale: value, child: child),
                ),
                child: Image.asset(
                  logo,
                  width: context.screenWidth * 0.5,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.local_car_wash_rounded,
                    size: 96,
                    color: whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'app_name'.tr,
                style: TextStyle(
                  fontFamily: lateef,
                  fontSize: 44,
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'tagline'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  color: whiteColor.withValues(alpha: 0.85),
                ),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(
                  strokeWidth: 2.6,
                  color: lightCyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
