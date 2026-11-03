import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// بطاقة قائمة «ما تشمله الخدمة» بعلامات صح.
class IncludesCard extends StatelessWidget {
  final List<String> keys; // مفاتيح ترجمة

  const IncludesCard({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (final key in keys)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded,
                      size: 20, color: primaryBlue),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      key.tr,
                      style: TextStyle(
                        fontFamily: cairo,
                        fontWeight: FontWeight.w600,
                        color: darkNavy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}