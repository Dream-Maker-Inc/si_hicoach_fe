import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/common/utils/calendar.dart';
import 'package:si_hicoach_fe/domain/calendar/models/week.dart';
import 'package:si_hicoach_fe/domain/calendar/models/week_study_item.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_weekly_calendar_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';
import "package:collection/collection.dart";

class WeeklyCalendarViewModel extends _FetchController {
  RxString targetWeek = RxString('');
  int get targetWeekValue => int.parse(targetWeek.value);

  // 현재 선택된 월 week의 date 목록을 리턴
  List<DateTime> get daysOfTargetWeek {
    final dates = getCalendarVisibleDate();

    int index = 1;
    final daysOfWeeks = dates.groupListsBy((it) {
      return (index++ / 7).ceil();
    });

    return daysOfWeeks[targetWeekValue] ?? [];
  }

  // 현재 선택된 월 week dates에서 weekday로 선택
  DateTime findDayByWeekDay(int weekDay) {
    final index = (weekDay >= 7) ? 0 : weekDay;

    return daysOfTargetWeek[index];
  }

  // 월 week UI 모델
  List<WeekModel> get weekModels {
    final now = DateTime.now();
    final days = DateTime(now.year, now.month, 0).day;
    final weeks = (days / 7).ceil();

    return List.generate(
        weeks, (index) => WeekModel(month: now.month, week: index + 1));
  }

  // 스터디 아이템 UI 모델
  List<WeekStudyItemModel> get weekStudyItems {
    final targetWeek = this.targetWeek.value;

    final studies = _getWeekStudiesByWeek(int.parse(targetWeek));
    final models = studies
        .map((e) => WeekStudyItemModel(
            studyId: e.study.id,
            title: e.member.name,
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
    final targetDay = now.day;

    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfFirstWeek =
        DateTime(now.year, now.month, 7 - firstDayOfMonth.weekday);

    final restDay = targetDay - lastDayOfFirstWeek.day;

    final result = ((restDay / 7).ceil() + 1).toString();

    targetWeek.value = result;
  }
}

class _FetchController extends GetxController {
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

  //
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}
