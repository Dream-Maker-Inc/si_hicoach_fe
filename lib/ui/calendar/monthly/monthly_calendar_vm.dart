// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/common/calendar/week_model.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/infrastructure/holiday/dto/get_holiday_response.dart'
    as Holiday;
import 'package:si_hicoach_fe/infrastructure/holiday/holiday_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/calendar/member_calendar_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/dto/get_monthly_calendar_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/trainer_calendar_api.dart';

class MonthlyCalendarViewModel extends _MonthlyCalendarDataFetchFeature {
  DateTime targetDate;

  MonthlyCalendarViewModel({required this.targetDate});

  List<WeekModel> get weeksDetail {
    return targetDate.getWeeksDetail(isSundayFirst: true);
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }

  Future refetch() async {
    Future.wait([
      fetchMemberStudies(targetDate),
      fetchHolidaysOfThisMonth(targetDate),
    ]);
  }
}

// 월간 캘린더 데이터 불러오기
class _MonthlyCalendarDataFetchFeature extends _HolidayFetchFeature {
  final Rxn<GetMonthlyCalendarResponse> monthlyCalendarFetchResponse = Rxn();

  List<Data> get _data => monthlyCalendarFetchResponse.value?.data ?? [];

  int findPersonalStudyCountByDate(DateTime date) {
    return _data
            .firstWhereOrNull(
              (it) => it.date.dateOnly == date.dateOnly,
            )
            ?.personalStudyCount ??
        0;
  }

  int findMemberStudyCountByDate(DateTime date) {
    return _data
            .firstWhereOrNull(
              (it) => it.date.dateOnly == date.dateOnly,
            )
            ?.memberStudyCount ??
        0;
  }

  Future fetchMemberStudies(DateTime targetDate) async {
    final isRoleTrainer = await SharedPrefsManager().isRoleTrainer();

    final yearMonth = targetDate.toYearMonth;

    final result = isRoleTrainer
        ? await TrainerCalendarApi.getMonthlyData(
            yearMonth,
          )
        : await MemberCalendarApi.getMonthlyData(
            yearMonth,
          );

    result.when(
      (e) => (apiError.value = e),
      (res) => (monthlyCalendarFetchResponse.value = res),
    );
  }
}

// 이번달 공휴일 정보 불러오기
class _HolidayFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<Holiday.GetHolidayResponse> fetchHolidayResponse = Rxn();

  List<Holiday.Data> get holidays => fetchHolidayResponse.value?.data ?? [];

  Holiday.Data? findHoliday(DateTime date) {
    return holidays.firstWhereOrNull(
      (it) => it.date.toDateOnly == date.toDateOnly,
    );
  }

  bool isHoliday(DateTime date) {
    return findHoliday(date) != null;
  }

  Future fetchHolidaysOfThisMonth(DateTime targetDate) async {
    final yearMonth = targetDate.toYearMonth;

    final result = await HolidayApi.getHolidays(yearMonth);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchHolidayResponse.value = res),
    );
  }
}
