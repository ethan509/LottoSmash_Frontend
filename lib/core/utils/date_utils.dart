import 'package:intl/intl.dart';

class AppDateUtils {
  static final _dateFormat = DateFormat('yyyy.MM.dd');
  static final _dateTimeFormat = DateFormat('yyyy.MM.dd HH:mm');

  static String formatDate(DateTime date) => _dateFormat.format(date);

  static String formatDateTime(DateTime date) => _dateTimeFormat.format(date);

  static String formatDateString(String dateStr) {
    // "2024.02.10" 형식은 그대로 반환
    if (RegExp(r'^\d{4}\.\d{2}\.\d{2}$').hasMatch(dateStr)) {
      return dateStr;
    }
    // ISO 8601 형식 파싱
    try {
      final date = DateTime.parse(dateStr);
      return _dateFormat.format(date);
    } catch (_) {
      return dateStr;
    }
  }

  static DateTime? tryParse(String dateStr) {
    try {
      return DateTime.parse(dateStr);
    } catch (_) {
      return null;
    }
  }
}
