import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// زر تواصل مربع: أيقونة ملونة + عنوان.
class ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const ContactOption({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: darkNavy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}