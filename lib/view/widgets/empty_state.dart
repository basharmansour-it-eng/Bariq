import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// حالة «لا يوجد محتوى» الموحّدة: أيقونة + عنوان + وصف + زر اختياري.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionText;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightCyan.withValues(alpha: 0.3),
              ),
              child: Icon(icon, size: 54, color: primaryBlue),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: darkNavy,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: cairo,
                height: 1.6,
                color: darkNavy.withValues(alpha: 0.6),
              ),
            ),
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onAction,
                  child: Text(actionText!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}