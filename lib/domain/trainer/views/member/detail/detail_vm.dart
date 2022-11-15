import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/models/exercise_goal_model.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/models/latest_study_model.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/models/member_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/member/dto/get_member_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/member/trainer_member_page_api.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class MemberDetailViewModel extends GetxController {
  int trainerId = 0;
  int memberId = 0;

  //
  RxInt tabIndex = RxInt(0);

  MemberModel get member {
    final birthDay =
        DateTime.parse(_member?.birthDay ?? DateTime.now().toIso8601String());

    return MemberModel(
        id: _member?.id ?? 0,
        name: _member?.name ?? "",
        birthDay: birthDay,
        gender: _member?.gender ?? "");
  }

  LatestStudyModel get latestStudy {
    final startedAt = DateTime.parse(
        _latestStudy?.startedAt ?? DateTime.now().toIso8601String());

    return LatestStudyModel(
        id: _latestStudy?.id ?? 0,
        startedAt: startedAt,
        finishedStudyCount: _latestStudy?.totalStudyCount ?? 0,
        totalStudyCount: _matching?.ticketCount ?? 0);
  }

  List<ExerciseGoalModel> get exerciseGoals =>
      _matching?.goals
          .map((it) => ExerciseGoalModel(id: it.id, title: it.title))
          .toList() ??
      [];

  String get memo => _matching?.memo ?? "";

  //
  Rx<Exception?> apiError = Rx(null);

  // fetch member info tab data
  final Rxn<GetMemberPageResponse> fetchMemberPageResponse = Rxn();

  Member? get _member => fetchMemberPageResponse.value?.data.member;

  Matching? get _matching => fetchMemberPageResponse.value?.data.matching;

  LatestStudy? get _latestStudy =>
      fetchMemberPageResponse.value?.data.latestStudy;

  fetchMemberInfo() async {
    final result = await TrainerMemberPageApi.getData(memberId);

    result.when((e) => (apiError.value = e),
        (response) => (fetchMemberPageResponse.value = response));
  }

  // fetch studies
  final Rxn<GetMemberStudiesResponse> fetchMemberStudiesResponse = Rxn();

  List<Items> get memberStudies =>
      fetchMemberStudiesResponse.value?.data.items ?? [];

  fetchMemberStudies() async {
    final result = await StudyApi.getMemberStudies(
        trainerId: trainerId, memberId: memberId);

    result.when((e) => (apiError.value = e),
        (response) => (fetchMemberStudiesResponse.value = response));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    await _initUserId();

    ever(tabIndex, _handleTabIndexChange);
  }

  _initUserId() async {
    final prefs = await SharedPreferences.getInstance();
    trainerId = prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }

  _handleTabIndexChange(int index) {
    if (index == 0) {
      fetchMemberInfo();
    }

    if (index == 1) {
      fetchMemberStudies();
    }
  }
}
