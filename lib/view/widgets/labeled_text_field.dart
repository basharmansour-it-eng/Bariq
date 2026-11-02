import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form_label.dart';

/// حقل نص مع عنوان فوقه، يستخدم تنسيق الثيم العام.
class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final IconData? prefixIcon;
  final String? errorText;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.prefixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          textDirection: textDirection,
          style: TextStyle(
            fontFamily: cairo,
            fontWeight: FontWeight.w600,
            color: darkNavy,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: cairo,
              color: darkNavy.withValues(alpha: 0.3),
            ),
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}