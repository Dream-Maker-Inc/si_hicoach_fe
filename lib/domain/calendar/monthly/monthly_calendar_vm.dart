// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/calendar/calendar.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/calendar/models/monthly_day_item.dart';
import 'package:si_hicoach_fe/infrastructure/holiday/dto/get_holiday_response.dart'
    as Holiday;
import 'package:si_hicoach_fe/infrastructure/holiday/holiday_api.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_weekly_calendar_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class MonthlyCalendarViewModel extends _FetchController {
  DateTime targetDate;

  MonthlyCalendarViewModel({required this.targetDate});

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

class _FetchController extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch
  final Rxn<GetWeeklyCalendarResponse> fetchWeeklyCalendarResponse = Rxn();

  List<Items> get _items => fetchWeeklyCalendarResponse.value?.data.items ?? [];

  Future fetchMemberStudies(DateTime targetDate) async {
    final trainerId = await SharedPrefsManager().getUserId();
    final yearMonth = targetDate.toYearMonth;

    final result = await StudyApi.getWeeklyCalendarStudies(
      trainerId: trainerId,
      yearMonth: yearMonth,
    );

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchWeeklyCalendarResponse.value = res),
    );
  }

  // fetch holidays of this month
  final Rxn<Holiday.GetHolidayResponse> fetchHolidayResponse = Rxn();

  List<Holiday.Data> get holidays => fetchHolidayResponse.value?.data ?? [];

  Future fetchHolidaysOfThisMonth(DateTime targetDate) async {
    final yearMonth = targetDate.toYearMonth;

    final result = await HolidayApi.getHolidays(yearMonth);

    result.when((e) => (apiError.value = e),
        (response) => (fetchHolidayResponse.value = response));
  }
}
