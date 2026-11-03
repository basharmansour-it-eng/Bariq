import 'package:get/get.dart';

/// اليوم / غداً / اسم اليوم.
String dayLabel(DateTime d) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final diff = DateTime(d.year, d.month, d.day).difference(today).inDays;
  if (diff == 0) return 'today'.tr;
  if (diff == 1) return 'tomorrow'.tr;
  return 'weekday_${d.weekday}'.tr;
}

String _t(int h) => '${h.toString().padLeft(2, '0')}:00';

/// 08:00 - 10:00 (معزول الاتجاه حتى لا تنعكس الأرقام في الواجهة العربية)
String slotLabel(DateTime start, int windowHours) =>
    '\u2066${_t(start.hour)} - ${_t(start.hour + windowHours)}\u2069';

/// نص الموعد: «في أقرب وقت» أو «غداً 3/11 • 10:00 - 12:00»
String whenLabel(DateTime? start, int windowHours) {
  if (start == null) return 'when_now_hint'.tr;
  return '${dayLabel(start)} ${start.day}/${start.month} • '
      '${slotLabel(start, windowHours)}';
}

/// موعد الطلب: المجدول، أو «في أقرب وقت» للجاري، أو تاريخ الطلب للمنتهي.
String orderTimeLabel({
  required DateTime? scheduledStart,
  required DateTime createdAt,
  required bool isActive,
  required int windowHours,
}) {
  if (scheduledStart != null) return whenLabel(scheduledStart, windowHours);
  if (isActive) return 'when_now_hint'.tr;
  return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
}

/// بعد شهر من التاريخ نفسه (مع ضبط نهاية الشهر: 31 يناير ← 28 فبراير).
DateTime addOneMonth(DateTime d) {
  final lastDayOfNextMonth = DateTime(d.year, d.month + 2, 0).day;
  return DateTime(
    d.year,
    d.month + 1,
    d.day > lastDayOfNextMonth ? lastDayOfNextMonth : d.day,
  );
}

/// 3/11/2026 (معزول الاتجاه)
String dateLabel(DateTime d) => '\u2066${d.day}/${d.month}/${d.year}\u2069';