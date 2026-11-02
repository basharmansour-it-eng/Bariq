import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// بطاقة المستخدم المتدرجة (الصورة الرمزية + الاسم + الهاتف).
class UserCard extends StatelessWidget {
  final String name;
  final String phone;
  final String initial;

  const UserCard({
    super.key,
    required this.name,
    required this.phone,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryBlue, secondaryBlue],
        ),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
            ),
            child: Text(
              initial,
              style: TextStyle(
                fontFamily: cairo,
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: primaryBlue,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: cairo,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: whiteColor,
                  ),
                ),
                if (phone.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    phone,
                    style: TextStyle(
                      fontFamily: cairo,
                      fontSize: 13,
                      color: whiteColor.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}