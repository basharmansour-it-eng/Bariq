import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// عنوان قسم في الرئيسية: شريط أصفر + العنوان + زر "عرض الكل".
class HomeSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const HomeSectionTitle({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 22,
          decoration: BoxDecoration(
            color: accentYellow,
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