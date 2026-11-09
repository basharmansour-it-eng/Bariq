import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// سؤال شائع قابل للطي.
class FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const FaqTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        color: whiteColor,
        child: Theme(
          // إزالة الخطوط الفاصلة التي يرسمها ExpansionTile
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            shape: const Border(),
            collapsedShape: const Border(),
            iconColor: primaryBlue,
            collapsedIconColor: darkNavy.withValues(alpha: 0.5),
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.centerLeft,
            title: Text(
              question,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: darkNavy,
              ),
            ),
            children: [
              Text(
                answer,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 13.5,
                  height: 1.7,
                  color: darkNavy.withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}