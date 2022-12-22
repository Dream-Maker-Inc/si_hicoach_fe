class WeekModel {
  int month;
  int week;
  bool isSelected;

  String get weekString => week.toString();
  String get isSelectedLabel => isSelected ? "(이번주)" : "";
  String get formattedWeek => "$month월 $week주차 $isSelectedLabel";

  WeekModel({required this.month, required this.week, this.isSelected = false});
}
