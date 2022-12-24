import 'package:intl/intl.dart';

class StudyModel {
  final int id;
  final int round;
  final DateTime startedAt;
  final DateTime endedAt;
  final bool isPersonal;

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

  String get exerciseTypeLabel {
    if (isPersonal) return "개인 일정";

    return "PT 수업";
  }

  StudyModel(
      {required this.id,
      required this.round,
      required this.startedAt,
      required this.endedAt,
      required this.isPersonal});
}
