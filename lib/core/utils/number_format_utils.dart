import 'package:intl/intl.dart';

class NumberFormatUtils {
  static final _numberFormat = NumberFormat('#,###');

  /// 숫자를 콤마 포맷으로 변환 (예: 1234567 → "1,234,567")
  static String formatNumber(int number) => _numberFormat.format(number);

  /// 금액을 한국식으로 변환 (예: 2500000000 → "25억")
  static String formatKrw(int amount) {
    if (amount >= 100000000) {
      // 억 단위
      final eok = amount ~/ 100000000;
      final remainder = amount % 100000000;
      if (remainder == 0) {
        return '$eok억원';
      }
      final man = remainder ~/ 10000;
      if (man > 0) {
        return '$eok억 ${_numberFormat.format(man)}만원';
      }
      return '$eok억원';
    } else if (amount >= 10000) {
      // 만 단위
      final man = amount ~/ 10000;
      final remainder = amount % 10000;
      if (remainder == 0) {
        return '${_numberFormat.format(man)}만원';
      }
      return '${_numberFormat.format(man)}만 ${_numberFormat.format(remainder)}원';
    } else {
      return '${_numberFormat.format(amount)}원';
    }
  }

  /// 확률을 퍼센트로 변환 (예: 0.6667 → "66.67%")
  static String formatPercent(double probability, {int decimals = 2}) {
    return '${(probability * 100).toStringAsFixed(decimals)}%';
  }

  /// 비율 포맷 (예: "3:3")
  static String formatRatio(String ratio) => ratio;
}
