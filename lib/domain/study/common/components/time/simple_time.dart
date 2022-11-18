import 'package:intl/intl.dart';

class SimpleTime {
  int hour;
  int minute;

  SimpleTime({required this.hour, this.minute = 0});

  _toTwoDigitOrNothing(int number) => (number > 9) ? '$number' : '0$number';

  getTime() {
    return "$hour시 $minute분";
  }

  getStudyEndTime() {
    return "$hour시 50분";
  }

  DateTime getDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day, hour, minute);

    return today;
  }

  DateTime getEndDate() {
    final today = getDate();
    final endDate = DateTime(
        today.year, today.month, today.day, today.hour, today.minute + 50);

    return endDate;
  }

  String getLocalDateFormat(DateTime date) {
    return DateFormat("yyyy-MM-dd HH:mm:ss:SSS'Z'").format(date);
  }

  String getLocalDate() {
    return getLocalDateFormat(getDate());
  }

  String getLocalDateOfEndDate() {
    return getLocalDateFormat(getEndDate());
  }
}
