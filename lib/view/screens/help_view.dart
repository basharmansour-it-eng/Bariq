import 'package:bariq/controller/app/help_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/constant/support_config.dart';
import '../../model/help_content.dart';
import '../widgets/contact_option.dart';
import '../widgets/faq_tile.dart';
import '../widgets/menu_card.dart';
import '../widgets/menu_tile.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile_help'.tr)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            'help_title'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'help_hours'.trParams({
              'from': '\u2066${SupportConfig.hoursFrom}\u2069',
              'to': '\u2066${SupportConfig.hoursTo}\u2069',
            }),
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 13,
              color: darkNavy.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ContactOption(
                  icon: Icons.chat_rounded,
                  label: 'help_whatsapp'.tr,
                  color: const Color(0xFF25D366),
                  onTap: controller.openWhatsapp,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ContactOption(
                  icon: Icons.call_rounded,
                  label: 'help_call'.tr,
                  color: primaryBlue,
                  onTap: controller.callSupport,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ContactOption(
                  icon: Icons.mail_rounded,
                  label: 'help_email'.tr,
                  color: Colors.orange,
                  onTap: controller.emailSupport,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            'help_faq'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          const SizedBox(height: 12),
          for (final item in faqItems)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FaqTile(
                question: item.questionKey.tr,
                answer: item.answerKey.tr,
              ),
            ),
          const SizedBox(height: 14),
          MenuCard(children: [
            MenuTile(
              icon: Icons.shield_rounded,
              title: 'profile_terms'.tr,
              onTap: controller.openLegal,
            ),
          ]),
        ],
      ),
    );
  }
}