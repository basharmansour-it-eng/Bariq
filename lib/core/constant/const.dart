// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ─── الألوان ───────────────────────────────────────────
const Color primaryBlue = Color(0xFF0075E5);
const Color secondaryBlue = Color(0xFF06A6FA);

const Color lightCyan = Color(0xFF58CAFA);
const Color darkNavy = Color(0xFF042063);

const Color deepBlue = Color(0xFF001875);
const Color whiteColor = Color(0xFFFFFFFF);

const Color backgroundColor = Color(0xFFF4F8FD);

// ─── الخطوط ───────────────────────────────────────────
String cairo = 'Cairo';
String lateef = 'Lateef';
// ─── الصور ────────────────────────────────────────────
String logo = 'assets/images/logo.png';
String mainImage = 'assets/images/bariqMainImage.png';

// ─── Extension للقيم الديناميكية ──────────────────────
extension AppSize on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get keyboard => MediaQuery.of(this).viewInsets.bottom;
}

String success = 'success';
String fail = 'fail';
