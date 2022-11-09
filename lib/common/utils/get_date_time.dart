import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class Utils {
  static final DateTime dateTime = DateTime.now();
  static late DateFormat formatter;

  static final List<String> englishDate = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static final List<String> koreanDate = ['월', '화', '수', '목', '금', '토', '일'];

  static String getCurrentDateTime(String type) {
    switch (type) {
      case 'year_month_date':
        formatter = DateFormat('yyyy년 MM월 dd일');
        break;
      case 'year_month':
        formatter = DateFormat('yyyy년 MM월');
        break;
      case 'time_minute_second':
        formatter = DateFormat('hh시 mm분 ss초');
        break;
      case 'format':
        formatter = DateFormat('yyyy년 MM월 dd일 hh시 mm분 ss초');
        break;
      case 'date_number':
        // 1~마지막일
        formatter = DateFormat('d');
        break;
      case 'date_text':
        // 월화수목금토일
        formatter = DateFormat('E');
        break;
      case 'time':
        // 당일 시간
        formatter = DateFormat('H');
        break;
      case 'month':
        // 이번 달
        formatter = DateFormat('MM');
        break;
    }

    String formattedDate = formatter.format(dateTime);

    englishDate.forEachIndexed((int index, String element) {
      if (formattedDate == element) {
        formattedDate = koreanDate[index];
      }
    });

    return formattedDate;
  }

  static int getLastDayOfThisMonth() {
    DateTime lastDayOfThisMonth = DateTime(
      dateTime.year,
      dateTime.month + 1,
      0,
    );
    return lastDayOfThisMonth.day;
  }

  static String getDayTextFromDayNumber(int dayNumber) {
    DateTime day = DateTime(dateTime.year, dateTime.month, dayNumber);
    String engResult = DateFormat('E').format(day);
    String krResult = '';

    switch (engResult) {
      case 'Mon':
        krResult = '월';
        break;
      case 'Tue':
        krResult = '화';
        break;
      case 'Wed':
        krResult = '수';
        break;
      case 'Thu':
        krResult = '목';
        break;
      case 'Fri':
        krResult = '금';
        break;
      case 'Sat':
        krResult = '토';
        break;
      case 'Sun':
        krResult = '일';
        break;
    }

    return krResult;
  }
}
