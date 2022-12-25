import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/common/calendar/week_model.dart';
import 'package:tuple/tuple.dart';

// 오늘 날짜 기준 Week 값
// ignore_for_file: constant_identifier_names

int getNowWeek() {
  final now = DateTime.now();
  final targetDay = now.day;

  final firstDayOfMonth = DateTime(now.year, now.month, 1);
  final lastDayOfFirstWeek =
      DateTime(now.year, now.month, 7 - firstDayOfMonth.weekday);

  final restDay = targetDay - lastDayOfFirstWeek.day;

  final result = ((restDay / 7).ceil() + 1);

  return result;
}

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

const SEVEN_DAYS = 7;
const THURS_DAY = 4;

extension DateTimeExtension on DateTime {
  String get dateOnly {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  // 해당 날짜가 이번 달에 속하는지
  bool get isThisMonth {
    final now = DateTime.now();
    return month == now.month;
  }

  // 해당 날짜가 속한 월의 모든 날짜 리턴
  List<DateTime> get dateTimesOfMonth {
    final endedDay = DateTime(year, month + 1, 0).day;

    final result = List.generate(
      endedDay,
      (index) => DateTime(year, month, index + 1),
    );

    return result;
  }

  // 타겟 날짜가 속한 월의 시작일의 weekday 인덱스
  int get firstWeekdayOfMonth => dateTimesOfMonth.first.weekday;

  // 타겟 날짜가 속한 월의 종료일의 weekday 인덱스
  int get lastWeekdayOfMonth => dateTimesOfMonth.last.weekday;

  // 저번달 마지막 주차와 이번달 첫 주차에 겹치는 저번달 날짜들
  List<DateTime> get lastMonthPaddingDates {
    return List.generate(
      firstWeekdayOfMonth - 1,
      (index) => DateTime(year, month, -index),
    ).reversed.toList();
  }

  // 다음달 첫 주차와 이번달 마지막 주차에 겹치는 다음달 날짜들
  List<DateTime> get nextMonthPaddingDates {
    return List.generate(
      (SEVEN_DAYS - lastWeekdayOfMonth),
      (index) => DateTime(year, month + 1, index + 1),
    );
  }

  // 이번달 주차(week)기준 모든 날짜 목록 (저번달 패딩, 다음달 패딩 포함)
  List<DateTime> get datesOfMonthWeeks {
    return [
      ...lastMonthPaddingDates,
      ...dateTimesOfMonth,
      ...nextMonthPaddingDates
    ];
  }

  // 해당 월의 시작일이 해당 월의 week에 속하는지
  get isStartDayInWeeksOfThisMonth {
    final startedDay = DateTime(year, month, 1);
    return startedDay.weekday <= THURS_DAY;
  }

  // 해당 월의 종료일이 해당 월의 week에 속하는지
  get isEndDayInWeeksOfThisMonth {
    final endedDay = DateTime(year, month + 1, 0);
    return endedDay.weekday >= THURS_DAY;
  }

  // 해당 날짜가 속한 월의 모든 주차[week, DateTimes] 리턴
  List<WeekModel> get weeksDetail {
    final minusIndex = isStartDayInWeeksOfThisMonth ? 0 : 1;

    final result = datesOfMonthWeeks
        .asMap()
        .entries
        .groupListsBy((it) => ((it.key) / SEVEN_DAYS).ceil())
        .entries
        .map(
          (it) {
            return Tuple2(
              it.key - minusIndex,
              it.value.map((it) => it.value).toList(),
            );
          },
        )
        .where((it) => it.item1 > 0)
        .map(
          (it) => WeekModel(
            year: year,
            month: month,
            week: it.item1,
            dates: it.item2,
          ),
        )
        .toList();

    if (!isEndDayInWeeksOfThisMonth) {
      result.removeLast();
    }

    return result;
  }

  // 해당 월의 마지막 week 값 구하기
  int get lastWeek {
    final lastRow = (datesOfMonthWeeks.length / SEVEN_DAYS).ceil();
    final value1 = isStartDayInWeeksOfThisMonth ? lastRow : (lastRow - 1);
    final result = isEndDayInWeeksOfThisMonth ? value1 : (value1 - 1);

    return result;
  }

  // 해당 날짜가 속한 월 주차 상세 정보
  WeekModel get weekDetail {
    final targetIndex =
        datesOfMonthWeeks.indexWhere((it) => it.dateOnly == dateOnly);

    // 해당 월의 첫 행
    const firstRow = 1;

    // 해당 월의 마지막 행
    final lastRow = (datesOfMonthWeeks.length / SEVEN_DAYS).ceil();

    // 타겟 인덱스까지 날짜 목록 자르기
    final slicedDates = datesOfMonthWeeks.slice(0, targetIndex + 1);

    // 타겟 인덱스의 행 값
    final row = (slicedDates.length / SEVEN_DAYS).ceil();

    // 월의 첫 번째 행에 속하는 경우
    if (row == firstRow) {
      // 시작일이 해당 월의 week에 속하는 경우
      if (isStartDayInWeeksOfThisMonth) {
        return getWeekDetail(
          year: year,
          month: month,
          week: row,
        );
      }

      // 시작일이 이전 월의 week에 속하는 경우
      final lastDateOfLastMonth = DateTime(year, month, 0);

      return getWeekDetail(
        year: lastDateOfLastMonth.year,
        month: lastDateOfLastMonth.month,
        week: lastDateOfLastMonth.lastWeek,
      );
    }

    // 마지막 행에 속하는 경우
    if (row == lastRow) {
      // 마지막 일이 월의 week에 속하는 경우
      if (isEndDayInWeeksOfThisMonth) {
        return getWeekDetail(
          year: year,
          month: month,
          week: row,
        );
      }

      // 마지막 일이 다음 월의 week에 속하는 경우
      final firstDateOfNextMonth = DateTime(year, month + 1, 1);

      return getWeekDetail(
        year: firstDateOfNextMonth.year,
        month: firstDateOfNextMonth.month,
        week: 1,
      );
    }

    // 시작일이 해당 월의 week에 속하는 경우
    if (isStartDayInWeeksOfThisMonth) {
      return getWeekDetail(
        year: year,
        month: month,
        week: row,
      );
    }

    // 시작일이 해당 월의 week에 속하지 않는 경우
    return getWeekDetail(
      year: year,
      month: month,
      week: row - 1,
    );
  }
}

// 월 주차 상세 정보 구하기
WeekModel getWeekDetail({
  required int year,
  required int month,
  required int week,
}) {
  // 기준 일
  final baseDate = DateTime(year, month, 1);

  // 월 주차 최대값 초과시
  if (week > baseDate.lastWeek) {
    final restWeek = week - baseDate.lastWeek;
    final date = DateTime(year, month + 1, 1);

    return getWeekDetail(
      year: date.year,
      month: date.month,
      week: restWeek,
    );
  }

  // 월 주차 최소값 미만시
  if (week <= 0) {
    final date = DateTime(year, month - 1, 1);

    return getWeekDetail(
      year: date.year,
      month: date.month,
      week: date.lastWeek + week,
    );
  }

  // 첫 row가 해당 월의 week 속하지 않는 경우 뺄 값
  final minusIndex = baseDate.isStartDayInWeeksOfThisMonth ? 0 : 1;

  final result = baseDate.datesOfMonthWeeks
      .asMap()
      .entries
      .groupListsBy((it) => ((it.key + 1) / SEVEN_DAYS).ceil())
      .entries
      .map(
        (it) => WeekModel(
          year: year,
          month: month,
          week: it.key - minusIndex,
          dates: it.value.map((it) => it.value).toList(),
        ),
      )
      .where(
        (it) => (it.year == year) && (it.month == month) && (it.week == week),
      )
      .last;

  return result;
}
