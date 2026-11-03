import 'package:bariq/controller/app/offers_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/promo_offer_card.dart';
import '../widgets/section_header.dart';
import '../widgets/subscription_card.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text(
              'tab_offers'.tr,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: darkNavy,
              ),
            ),
            const SizedBox(height: 20),

            // ───── الاشتراكات ─────
            SectionHeader(title: 'offers_plans_title'.tr),
            _Subtitle('offers_plans_subtitle'.tr),
            const SizedBox(height: 12),
            for (final plan in controller.plans)
              Builder(builder: (_) {
                final service = controller.serviceFor(plan);
                if (service == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: SubscriptionCard(
                    plan: plan,
                    unitPrice: service.fromPrice,
                    onTap: () => controller.openPlan(plan),
                  ),
                );
              }),
            const SizedBox(height: 10),

            // ───── الأكواد ─────
            SectionHeader(title: 'offers_codes_title'.tr),
            _Subtitle('offers_codes_subtitle'.tr),
            const SizedBox(height: 12),
            for (final promo in controller.promos)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: PromoOfferCard(
                  promo: promo,
                  onCopy: () => controller.copyCode(promo.code),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  final String text;
  const _Subtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: cairo,
        fontSize: 13,
        color: darkNavy.withValues(alpha: 0.6),
      ),
    );
  }
}