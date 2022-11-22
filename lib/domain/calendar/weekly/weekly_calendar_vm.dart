import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/models/week.dart';
import 'package:si_hicoach_fe/domain/calendar/weekly/models/week_study_item.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_weekly_calendar_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class WeeklyCalendarViewModel extends _FetchController {
  RxString targetWeek = RxString('');

  List<WeekModel> get weeks {
    final now = DateTime.now();
    final days = DateTime(now.year, now.month, 0).day;
    final weeks = (days / 7).ceil();

    return List.generate(
        weeks, (index) => WeekModel(month: now.month, week: index + 1));
  }

  List<WeekStudyItemModel> get weekStudyItems {
    final targetWeek = this.targetWeek.value;

    final studies = _getWeekStudiesByWeek(int.parse(targetWeek));
    final models = studies
        .map((e) => WeekStudyItemModel(
            studyId: e.study.id,
            memberName: e.member.name,
            weekDay: e.weekDay,
            startedAt: e.study.startedAt,
            endedAt: e.study.endedAt))
        .toList();

    return models;
  }

  List<Studies> _getWeekStudiesByWeek(int week) =>
      _items.where((it) => it.week == week).expand((e) => e.studies).toList();

  @override
  onInit() {
    super.onInit();

    _handleWeeksDataUpdate();

    ever(fetchWeeklyCalendarResponse,
        (res) => _handleFetchWeeklyCalendarResponse(res));
  }

  _handleFetchWeeklyCalendarResponse(GetWeeklyCalendarResponse? res) {}

  _handleWeeksDataUpdate() {
    final now = DateTime.now();
    targetWeek.value = (now.day / 7).ceil().toString();
  }
}

class _FetchController extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch
  final Rxn<GetWeeklyCalendarResponse> fetchWeeklyCalendarResponse = Rxn();

  List<Items> get _items => fetchWeeklyCalendarResponse.value?.data.items ?? [];

  Future fetchMemberStudies() async {
    final trainerId = await getUserId();

    final result = await StudyApi.getWeeklyCalendarStudies(
        trainerId: trainerId, yearMonth: "2022-11");

    result.when((e) => (apiError.value = e),
        (response) => (fetchWeeklyCalendarResponse.value = response));
  }

  //
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}
