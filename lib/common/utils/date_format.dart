import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String get toKoreanFormat {
    final DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
    return formatter.format(this);
  }

  String get toKoreanTimeFormat {
    final DateFormat formatter = DateFormat('HH시 mm분');
    return formatter.format(this);
  }

  String get toYearMonth {
    final DateFormat formatter = DateFormat('yyyy-MM');
    return formatter.format(this);
  }

  String get toOnlyDate {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }
}
