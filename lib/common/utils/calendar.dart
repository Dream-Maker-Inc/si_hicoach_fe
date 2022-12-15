// 이번 달 week의 수
int getThisMonthWeeks() {
  // 일주일의 days 수
  const oneWeek = 7;

  final now = DateTime.now();

  // 이번 달의 시작일
  final firstDayOfThisMonth = DateTime(now.year, now.month, 1);

  // 이번 달의 시작 일의 weekday 인덱스
  final firstWeekdayOfThisMonth = firstDayOfThisMonth.weekday;

  // 이번 달의 총 day의 수
  final days = (DateTime(now.year, now.month + 1, 0).day);

  // 이번 달의 총 week 수
  final weekOfThisMonth = ((firstWeekdayOfThisMonth + days) / oneWeek).ceil();

  return weekOfThisMonth;
}

// 캘린더에서 보여져야 할 저번 달의 날짜들
List<DateTime> getCalendarLastMonthVisibleDate() {
  final now = DateTime.now();

  // 이번 달의 시작일
  final firstDayOfThisMonth = DateTime(now.year, now.month, 1);

  // 저번 달의 마지막 일
  final lastDayOfLastMonth = DateTime(now.year, now.month, -1);

  // 이번 달의 시작 일의 weekday 인덱스
  final firstWeekdayOfThisMonth = firstDayOfThisMonth.weekday;

  // 캘린더에 보여야 할 저번 달의 days
  final dateListOfLastMonth = List.generate(
          firstWeekdayOfThisMonth,
          (index) => DateTime(
              lastDayOfLastMonth.year, lastDayOfLastMonth.month + 1, -(index)))
      .reversed
      .toList();

  return dateListOfLastMonth;
}

// 캘린더에서 보여져야 할 모든 날짜들
List<DateTime> getCalendarVisibleDate() {
  final now = DateTime.now();

  // 이번 달의 총 day의 수
  final days = (DateTime(now.year, now.month + 1, 0).day);

  // 캘린더에 보여야 할 저번 달의 days
  final dateListOfLastMonth = getCalendarLastMonthVisibleDate();

  // 이번 달 days
  final daysOfThisMonth =
      List.generate(days, (index) => DateTime(now.year, now.month, index + 1));

  // 이번 달의 days 수와 저번 달의 캘린더에 보여야 할 days 수의 합
  final daysOfThisMonthAndLastMonth =
      daysOfThisMonth.length + dateListOfLastMonth.length;

  // 이번 달의 총 week 수
  final weekOfThisMonth = getThisMonthWeeks();

  // 캘린더에 보여야 할 총 days 수
  final showCount = weekOfThisMonth * 7;

  // 캘린더에 보여야 할 다음 달 days 수
  final restCount = showCount - daysOfThisMonthAndLastMonth;

  // 캘린더에 보여야 할 다음 달 days
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
