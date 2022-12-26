import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/common/calendar/week_model.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/dto/get_calendar_data_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/trainer_calendar_api.dart';
import 'package:si_hicoach_fe/ui/calendar/weekly/week_model_extension.dart';

class WeeklyCalendarViewModel extends _SwiperFeature {
  final DateFormat _formatter = DateFormat('yyyy-MM-dd HH');

  // time, weekDay로 스터디 데이터 찾기
  Items? findDataByTimeAndWeekDay(int time, int weekDay) {
    final date = getDateTimeByTimeAndWeekDay(time, weekDay);
    if (date == null) return null;

    // 날짜 시간 일치하는 데이터 선택
    final target = _items.firstWhereOrNull((it) {
      final startedAt = it.study.startedAt;
      return _formatter.format(startedAt) == _formatter.format(date);
    });

    return target;
  }

  @override
  void onInit() {
    super.onInit();

    ever(_targetDate, (_) {
      refetch();
    });
  }

  Future refetch() async {
    final yearMonth = targetDate.toYearMonth;
    fetchMemberStudies(yearMonth);
  }
}

// swiper
class _SwiperFeature extends _WeeklyCalendarDataFetchFeature {
  RxInt initialSwiperIndex = RxInt(1);
  RxInt swiperIndex = RxInt(1);

  @override
  void onInit() {
    super.onInit();

    ever(swiperIndex, (index) {
      _handleSwiperIndexChange(index);
    });
  }

  _handleSwiperIndexChange(int index) async {
    bool isLeft = index == 0;
    bool isRight = index == 2;

    if (isLeft) {
      final weekDetail = getWeekDetail(
        year: targetDate.weekDetail.year,
        month: targetDate.weekDetail.month,
        week: targetDate.weekDetail.week - 1,
      );

      return _targetDate.value = weekDetail.dates.first;
    }

    if (isRight) {
      final weekDetail = getWeekDetail(
        year: targetDate.weekDetail.year,
        month: targetDate.weekDetail.month,
        week: targetDate.weekDetail.week + 1,
      );

      return _targetDate.value = weekDetail.dates.first;
    }
  }
}

// 주간 캘린더 연월 데이터 불러오기
class _WeeklyCalendarDataFetchFeature extends _CalendarUiFeature {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetCalendarDataResponse> fetchWeeklyCalendarResponse = Rxn();
  List<Items> get _items => fetchWeeklyCalendarResponse.value?.data.items ?? [];

  Future fetchMemberStudies(String yearMonth) async {
    final result = await TrainerCalendarApi.getData(yearMonth);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchWeeklyCalendarResponse.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}

// 주간 캘린더 UI 동작 서비스
class _CalendarUiFeature extends GetxController {
  final Rx<DateTime> _targetDate = Rx(DateTime.now());
  DateTime get targetDate => _targetDate.value;

  // 일요일부터 시작하는 week dates
  RxList<DateTime> datesOnStartedSunday = RxList();

  // 타겟 월 주차 상세
  Rxn<WeekModel> targetWeekDetail = Rxn();

  // 월 주차 모델 목록
  RxList<String> monthWeeks = RxList();

  // time, weekday로 데이트 타임 찾기
  DateTime? getDateTimeByTimeAndWeekDay(int time, int weekDay) {
    final target = datesOnStartedSunday[weekDay - 1];

    return DateTime(
      target.year,
      target.month,
      target.day,
      time,
    );
  }

  // 현재 선택된 월 주차가 이번주인지
  bool get isThisWeek {
    final weekDetail = targetWeekDetail.value;
    if (weekDetail == null) return false;

    return weekDetail.isThisWeek;
  }

  @override
  void onInit() {
    super.onInit();

    _init();

    ever(_targetDate, (_) {
      _init();
    });
  }

  _init() async {
    _initDatesOnStartedSunday();
    _initWeekDetail();
    _initMonthWeeks();
  }

  // 일요일부터 시작하는 캘린더 형식에 맞춰 날짜 데이터 배열 수정
  _initDatesOnStartedSunday() async {
    final targetWeekDetail = targetDate.weekDetail;
    final prevWeekDetail = getWeekDetail(
      year: targetWeekDetail.year,
      month: targetWeekDetail.month,
      week: targetWeekDetail.week - 1,
    );

    final targetWeekDates = targetWeekDetail.dates;
    targetWeekDates.removeLast();

    final prevWeekLastDate = prevWeekDetail.dates.last;

    datesOnStartedSunday.value = [...targetWeekDates, prevWeekLastDate];
  }

  _initWeekDetail() async {
    targetWeekDetail.value = getWeekDetail(
      year: targetDate.weekDetail.year,
      month: targetDate.weekDetail.month,
      week: targetDate.weekDetail.week,
    );
  }

  // 월 주차 모델 초기화
  _initMonthWeeks() async {
    final weekDetail = getWeekDetail(
      year: targetDate.weekDetail.year,
      month: targetDate.weekDetail.month,
      week: targetDate.weekDetail.week,
    );

    monthWeeks.value = ["", weekDetail.label, ""];
  }
}
