import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String get toKoreanFormat {
    final DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
    return formatter.format(this);
  }
}