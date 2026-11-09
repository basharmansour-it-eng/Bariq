import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/help_content.dart';
import 'app_card.dart';

/// وثيقة قانونية: بنود مرقّمة، كل بند في بطاقة.
class LegalDocument extends StatelessWidget {
  final List<LegalSection> sections;

  const LegalDocument({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        Text(
          'legal_updated'.tr,
          style: TextStyle(
            fontFamily: cairo,
            fontSize: 12,
            color: darkNavy.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 14),
        for (var i = 0; i < sections.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\u2066${i + 1}.\u2069 ${sections[i].titleKey.tr}',
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: darkNavy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sections[i].bodyKey.tr,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 13.5,
                      height: 1.75,
                      color: darkNavy.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}