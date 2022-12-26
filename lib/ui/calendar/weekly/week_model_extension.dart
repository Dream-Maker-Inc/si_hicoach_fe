import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/common/calendar/week_model.dart';

extension WeekModelExtension on WeekModel {
  bool get isThisWeek => DateTime.now().isThisWeek(year, month, week);

  String get label => "$month월 $week주차";
}
