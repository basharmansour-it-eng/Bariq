import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// صف في القائمة: أيقونة + عنوان + (نص جانبي أو سهم).
/// مرّر color لجعله تحذيرياً (مثل تسجيل الخروج).
class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? trailingText;
  final Color? color;
  final bool showChevron;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingText,
    this.color,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    final mainColor = color ?? darkNavy;
    final iconColor = color ?? primaryBlue;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (color ?? lightCyan).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: mainColor,
                ),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText!,
                style: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w700,
                  color: primaryBlue,
                ),
              ),
            if (showChevron)
              Icon(Icons.chevron_right_rounded,
                  color: darkNavy.withValues(alpha: 0.35)),
          ],
        ),
      ),
    );
  }
}