class WeekModel {
  int month;
  int week;

  String get weekString => week.toString();
  String get formattedWeek => "$month월 $week주차";

  WeekModel({required this.month, required this.week});
}
