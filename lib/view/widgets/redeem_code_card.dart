import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/constant/referral_config.dart';

/// بطاقة "لديك كود من صديق؟" — تتحول لرسالة نجاح بعد التفعيل.
class RedeemCodeCard extends StatelessWidget {
  final TextEditingController controller;
  final String? redeemedCode;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final VoidCallback onRedeem;

  const RedeemCodeCard({
    super.key,
    required this.controller,
    required this.redeemedCode,
    required this.errorText,
    required this.onChanged,
    required this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: redeemedCode != null ? _success() : _form(),
    );
  }

  Widget _success() {
    return Row(
      children: [
        const Icon(Icons.check_circle_rounded,
            color: Color(0xFF1DB954), size: 26),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'ref_redeemed_note'.trParams({
              'code': '\u2066$redeemedCode\u2069',
              'amount': ReferralConfig.friendDiscount.toStringAsFixed(0),
            }),
            style: TextStyle(
              fontFamily: cairo,
              fontSize: 13.5,
              height: 1.5,
              color: darkNavy.withValues(alpha: 0.85),
            ),
          ),
        ),
      ],
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ref_redeem_title'.tr,
          style: TextStyle(
            fontFamily: cairo,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: darkNavy,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => onRedeem(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                    LengthLimitingTextInputFormatter(7),
                  ],
                  style: TextStyle(
                    fontFamily: cairo,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: darkNavy,
                  ),
                  decoration: InputDecoration(
                    hintText: 'BQXXXXX',
                    errorText: errorText,
                    prefixIcon: const Icon(Icons.confirmation_number_outlined),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            FilledButton(
              onPressed: onRedeem,
              style: FilledButton.styleFrom(
                minimumSize: const Size(90, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text('ref_redeem'.tr),
            ),
          ],
        ),
      ],
    );
  }
}