import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// عنوان صغير فوق مجموعة من العناصر (مثل: الحساب، عام).
class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4, right: 4),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: cairo,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: darkNavy.withValues(alpha: 0.55),
        ),
      ),
    );
  }
}