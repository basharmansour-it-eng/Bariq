import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// نافذة تأكيد موحّدة. تعيد true إن ضغط المستخدم على زر التأكيد.
///
/// if (await confirmDialog(title: ..., message: ..., confirmText: ...)) { ... }
Future<bool> confirmDialog({
  required String title,
  required String message,
  required String confirmText,
  bool destructive = true,
}) async {
  final result = await Get.dialog<bool>(
    AlertDialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: cairo,
          fontWeight: FontWeight.w800,
          color: darkNavy,
        ),
      ),
      content: Text(
        message,
        style: TextStyle(fontFamily: cairo, color: darkNavy),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text('cancel'.tr),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: Text(
            confirmText,
            style: TextStyle(
              color: destructive ? Colors.redAccent : primaryBlue,
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}