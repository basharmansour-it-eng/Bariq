import 'package:flutter/material.dart';

import 'form_label.dart';

/// عنوان قسم مع رابط إجراء اختياري على الطرف الآخر (مثل: إضافة).
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: FormLabel(title)),
        if (actionText != null)
          TextButton.icon(
            onPressed: onAction,
            icon: const Icon(Icons.add_rounded, size: 18),
            label: Text(actionText!),
          ),
      ],
    );
  }
}