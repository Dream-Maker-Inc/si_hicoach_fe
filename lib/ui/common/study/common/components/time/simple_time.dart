import 'package:intl/intl.dart';

class SimpleTime {
  DateTime? date;
  int hour;
  int minute;

  SimpleTime({this.date, required this.hour, this.minute = 0});

  getTime() {
    return "$hour시 $minute분";
  }

  getStudyEndTime() {
    return "$hour시 50분";
  }

  DateTime getDate() {
    final date = this.date!;
    final today = DateTime(date.year, date.month, date.day, hour, minute);

    return today;
  }

  DateTime getEndDate() {
    final today = getDate();
    final endDate = DateTime(
        today.year, today.month, today.day, today.hour, today.minute + 50);

    return endDate;
  }

  String getLocalDateFormat(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(date);
  }

  String getLocalDate() {
    return getLocalDateFormat(getDate());
  }

  String getLocalDateOfEndDate() {
    return getLocalDateFormat(getEndDate());
  }
}
