// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/common/utils/calendar.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/calendar/models/monthly_day_item.dart';
import 'package:si_hicoach_fe/infrastructure/holiday/dto/get_holiday_response.dart'
    as Holiday;
import 'package:si_hicoach_fe/infrastructure/holiday/holiday_api.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_weekly_calendar_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class MonthlyCalendarViewModel extends _FetchController {
  int get weeks => getThisMonthWeeks();

  List<MonthlyDayItemModel> getStudyItemModelsByWeek(int week) => _items
      .where((it) => it.week == week)
      .expand((e) => e.studies)
      .where((it) => !it.isPersonal)
      .map((e) => MonthlyDayItemModel(weekDay: e.weekDay))
      .toList();

  List<MonthlyDayItemModel> getPersonalStudyItemModelsByWeek(int week) => _items
      .where((it) => it.week == week)
      .expand((e) => e.studies)
      .where((it) => it.isPersonal)
      .map((e) => MonthlyDayItemModel(weekDay: e.weekDay))
      .toList();

  Holiday.Data? getHolidayOrNull(DateTime date) {
    return holidays
        .firstWhereOrNull((it) => it.date.toOnlyDate == date.toOnlyDate);
  }

  @override
  onInit() {
    super.onInit();

    ever(fetchWeeklyCalendarResponse,
        (res) => _handleFetchWeeklyCalendarResponse(res));
  }

  _handleFetchWeeklyCalendarResponse(GetWeeklyCalendarResponse? res) {}
}

class _FetchController extends GetxController {
  int userId = 0;

  Rx<Exception?> apiError = Rx(null);

  // fetch
  final Rxn<GetWeeklyCalendarResponse> fetchWeeklyCalendarResponse = Rxn();

  List<Items> get _items => fetchWeeklyCalendarResponse.value?.data.items ?? [];

  Future fetchMemberStudies() async {
    final trainerId = await getUserId();

    final result =
        await StudyApi.getWeeklyCalendarStudies(trainerId: trainerId);

    result.when((e) => (apiError.value = e),
        (response) => (fetchWeeklyCalendarResponse.value = response));
  }

  // fetch holidays of this month
  final Rxn<Holiday.GetHolidayResponse> fetchHolidayResponse = Rxn();

  List<Holiday.Data> get holidays => fetchHolidayResponse.value?.data ?? [];

  Future fetchHolidaysOfThisMonth() async {
    final now = DateTime.now();
    final yearMonth = now.toYearMonth;

    final result = await HolidayApi.getHolidays(yearMonth);

    result.when((e) => (apiError.value = e),
        (response) => (fetchHolidayResponse.value = response));
  }

  //
  @override
  onInit() async {
    super.onInit();

    userId = await getUserId();
  }

  //
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}
