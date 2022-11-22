import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/domain/calendar/models/monthly_day_item.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_weekly_calendar_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class MonthlyCalendarViewModel extends _FetchController {
  int get weeks {
    final now = DateTime.now();
    final days = DateTime(now.year, now.month, 0).day;
    final weeks = (days / 7).ceil();

    return weeks;
  }

  List<MonthlyDayItemModel> getStudyItemModelsByWeek(int week) => _items
      .where((it) => it.week == week)
      .expand((e) => e.studies)
      .where((it) => it.member.id != userId)
      .map((e) => MonthlyDayItemModel(weekDay: e.weekDay))
      .toList();

  List<MonthlyDayItemModel> getPersonalStudyItemModelsByWeek(int week) => _items
      .where((it) => it.week == week)
      .expand((e) => e.studies)
      .where((it) => it.member.id == userId)
      .map((e) => MonthlyDayItemModel(weekDay: e.weekDay))
      .toList();

  Holiday? getHolidayOrNull(DateTime date) {
    final studies = _items.expand((it) => it.studies);
    if (studies.isEmpty) return null;

    final holiday = studies.first.holiday;
    final formatter = DateFormat('yyyy-MM-dd');

    if (holiday == null) return null;

    if (formatter.format(holiday.date) != formatter.format(date)) {
      return null;
    }

    return holiday;
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
