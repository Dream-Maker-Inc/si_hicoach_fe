import 'package:intl/intl.dart';

class StudyItemModel {
  final int id;
  final int round;
  final DateTime startedAt;
  final DateTime endedAt;

  String get startedDateFormat {
    final dateFormatter = DateFormat('yyyy년 MM월 dd일');
    return dateFormatter.format(startedAt);
  }

  String get runningTimeFormatString {
    final time12Formatter = DateFormat('aa hh:mm', 'ko-KR');

    final startedTimeString = time12Formatter.format(startedAt);
    final endedTimeString = time12Formatter.format(endedAt);

    return "$startedTimeString ~ $endedTimeString";
  }

  StudyItemModel({
    required this.id,
    required this.round,
    required this.startedAt,
    required this.endedAt,
  });
}
