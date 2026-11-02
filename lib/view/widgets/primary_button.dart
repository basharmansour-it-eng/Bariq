import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// الزر الأساسي في التطبيق.
/// - onPressed = null  → معطّل (رمادي)
/// - isLoading = true  → يعرض مؤشر تحميل ويتجاهل الضغط
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed == null ? null : (isLoading ? () {} : onPressed),
      child: isLoading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.4,
                color: whiteColor,
              ),
            )
          : Text(text),
    );
  }
}
