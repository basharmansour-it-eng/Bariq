import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_card.dart';
import 'primary_button.dart';
import 'star_rating.dart';

/// بطاقة التقييم: نموذج إن لم يُقيَّم الطلب، وعرض للقراءة إن قُيِّم.
class RatingCard extends StatelessWidget {
  final int? rating;
  final String? review;

  final int draftRating;
  final ValueChanged<int> onRatingChanged;
  final TextEditingController commentController;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  const RatingCard({
    super.key,
    required this.rating,
    required this.review,
    required this.draftRating,
    required this.onRatingChanged,
    required this.commentController,
    required this.isSubmitting,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: rating != null ? _done() : _form(),
    );
  }

  Widget _done() {
    final text = review?.trim() ?? '';
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          StarRating(value: rating!, size: 30),
          const SizedBox(height: 10),
          Text(
            'rate_thanks'.tr,
            style: TextStyle(
              fontFamily: cairo,
              fontWeight: FontWeight.w800,
              color: darkNavy,
            ),
          ),
          if (text.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              '«$text»',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 13,
                height: 1.6,
                color: darkNavy.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _form() {
    return Column(
      children: [
        Text(
          'rate_title'.tr,
          style: TextStyle(
            fontFamily: cairo,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: darkNavy,
          ),
        ),
        const SizedBox(height: 14),
        StarRating(value: draftRating, size: 40, onChanged: onRatingChanged),
        const SizedBox(height: 6),
        SizedBox(
          height: 22,
          child: draftRating == 0
              ? null
              : Text(
                  'rate_label_$draftRating'.tr,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontWeight: FontWeight.w700,
                    color: primaryBlue,
                  ),
                ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          child: draftRating == 0
              ? const SizedBox(width: double.infinity)
              : Column(
                  children: [
                    const SizedBox(height: 12),
                    TextField(
                      controller: commentController,
                      maxLines: 3,
                      maxLength: 200,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'rate_comment_hint'.tr,
                      ),
                    ),
                    const SizedBox(height: 8),
                    PrimaryButton(
                      text: 'rate_submit'.tr,
                      isLoading: isSubmitting,
                      onPressed: onSubmit,
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}