import 'package:intl/intl.dart';

class Utils {
  static String getCurrentDateTime(String type) {
    DateTime dateTime = DateTime.now();
    late DateFormat formatter;

    switch (type) {
      case 'date':
        formatter = DateFormat('yyyy년 MM월 dd일');
        break;
      case 'time':
        formatter = DateFormat('hh시 mm분 ss초');
        break;
      case 'datetime':
      default:
        formatter = DateFormat('yyyy년 MM월 dd일 hh시 mm분 ss초');
        break;
    }

    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
}
