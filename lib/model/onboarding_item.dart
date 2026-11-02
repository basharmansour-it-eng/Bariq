import 'package:flutter/material.dart';

class OnboardingItem {
  final IconData icon;
  final String titleKey;
  final String descKey;

  const OnboardingItem({
    required this.icon,
    required this.titleKey,
    required this.descKey,
  });
}
