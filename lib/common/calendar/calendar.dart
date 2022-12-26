// ignore_for_file: constant_identifier_names

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/common/calendar/week_model.dart';
import 'package:tuple/tuple.dart';

// =================================================================

const _SEVEN_DAYS = 7;
const _THURS_DAY = 4;

// =================================================================
extension DateTimeExtension on DateTime {
  String get dateOnly {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  // 해당 날짜가 요청된 year,month에 속하는지
  bool isIncludeYearMonth(int year, int month) {
    return (this.year == year) && (this.month == month);
  }

  // 해당 날짜가 이번 달에 속하는지
  bool get isThisMonth {
    final now = DateTime.now();
    return month == now.month;
  }

  // 이번 주에 속하는지
  bool isThisWeek(int year, int month, int week) {
    final wd = weekDetail;

    return (wd.year == year) && (wd.month == month) && (wd.week == week);
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
      (_SEVEN_DAYS - lastWeekdayOfMonth),
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
    return startedDay.weekday <= _THURS_DAY;
  }

  // 해당 월의 종료일이 해당 월의 week에 속하는지
  get isEndDayInWeeksOfThisMonth {
    final endedDay = DateTime(year, month + 1, 0);
    return endedDay.weekday >= _THURS_DAY;
  }

  // 해당 날짜가 속한 월의 모든 주차[week, DateTimes] 리턴
  List<WeekModel> get weeksDetail {
    final minusIndex = isStartDayInWeeksOfThisMonth ? 0 : 1;

    final result = datesOfMonthWeeks
        .asMap()
        .entries
        .groupListsBy((it) => ((it.key + 1) / _SEVEN_DAYS).ceil())
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

  // 해당 날짜가 속한 월의 모든 주차[week, DateTimes] 리턴
  // sundayFirst인 경우 배열의 시작점을 전월 주차 일요일로 설정
  List<WeekModel> getWeeksDetail({bool isSundayFirst = false}) {
    final minusIndex = isStartDayInWeeksOfThisMonth ? 0 : 1;

    calcWeeksDetail(List<DateTime> dates) {
      final result = dates
          .asMap()
          .entries
          .groupListsBy((it) => ((it.key + 1) / _SEVEN_DAYS).ceil())
          .entries
          .map(
            (it) => Tuple2(
              it.key - minusIndex,
              it.value.map((it) => it.value).toList(),
            ),
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

    if (isSundayFirst) {
      final dates = datesOfMonthWeeks;
      final oldFirstDay = dates.first;
      final newFirstDay = DateTime(
        oldFirstDay.year,
        oldFirstDay.month,
        oldFirstDay.day - 1,
      );

      dates.removeLast();
      final newDates = [newFirstDay, ...dates];

      return calcWeeksDetail(newDates);
    }

    return calcWeeksDetail(datesOfMonthWeeks);
  }

  // 해당 월의 마지막 week 값 구하기
  int get lastWeek {
    final lastRow = (datesOfMonthWeeks.length / _SEVEN_DAYS).ceil();
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
    final lastRow = (datesOfMonthWeeks.length / _SEVEN_DAYS).ceil();

    // 타겟 인덱스까지 날짜 목록 자르기
    final slicedDates = datesOfMonthWeeks.slice(0, targetIndex + 1);

    // 타겟 인덱스의 행 값
    final row = (slicedDates.length / _SEVEN_DAYS).ceil();

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
      .groupListsBy((it) => ((it.key + 1) / _SEVEN_DAYS).ceil())
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
