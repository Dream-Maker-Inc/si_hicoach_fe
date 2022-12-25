class WeekModel {
  int year;
  int month;
  int week;
  List<DateTime> dates;

  String get label => "$month월 $week주차";

  WeekModel({
    required this.year,
    required this.month,
    required this.week,
    required this.dates,
  });
}
