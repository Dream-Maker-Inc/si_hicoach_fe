List<DateTime> getCalendarVisibleDate(int showCount) {
  final now = DateTime.now();
  final firstDayOfThisMonth = DateTime(now.year, now.month, 1);
  final lastDayOfLastMonth = DateTime(now.year, now.month, -1);
  final days = DateTime(now.year, now.month, 0).day;

  final firstWeekdayOfThisMonth = firstDayOfThisMonth.weekday;
  final dateListOfLastMonth = List.generate(
      firstWeekdayOfThisMonth,
      (index) => DateTime(lastDayOfLastMonth.year, lastDayOfLastMonth.month + 1,
          -(index + 1))).reversed;

  final daysOfThisMonth = List.generate(
      days - 1, (index) => DateTime(now.year, now.month, index + 1));

  final restCount =
      showCount - (daysOfThisMonth.length + dateListOfLastMonth.length);
  final restDaysOfNextMonth = List.generate(
      restCount, (index) => DateTime(now.year, now.month + 1, index + 1));

  return [...dateListOfLastMonth, ...daysOfThisMonth, ...restDaysOfNextMonth];
}

extension DateTimeExtension on DateTime {
  bool get isThisMonth {
    final now = DateTime.now();
    return month == now.month;
  }
}
