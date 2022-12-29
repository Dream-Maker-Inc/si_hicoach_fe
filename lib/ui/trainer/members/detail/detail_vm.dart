import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/models/exercise_goal_model.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/models/latest_study_model.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/models/member_model.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/member/dto/get_member_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/member/trainer_member_page_api.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class MemberDetailViewModel extends MatchingRemoveFeature {
  int memberId = 0;

  MemberDetailViewModel({required this.memberId});

  RxInt tabIndex = RxInt(0);

  // 멤버 데이터 모델
  MemberModel get member {
    final birthDay = DateTime.parse(
      _member?.birthDay ?? DateTime.now().toIso8601String(),
    );

    return MemberModel(
      id: _member?.id ?? 0,
      name: _member?.name ?? "",
      birthDay: birthDay,
      gender: _member?.gender ?? "",
    );
  }

  // 가장 최근 스터디 모델
  LatestStudyModel get latestStudy {
    final startedAt = (_latestStudy != null)
        ? DateTime.parse(_latestStudy!.startedAt).toKoreanFormat
        : "";

    return LatestStudyModel(
      id: _latestStudy?.id ?? 0,
      round: _latestStudy?.round ?? 0,
      startedAt: startedAt,
      finishedStudyCount:
          _fetchMemberPageResponse.value?.data.totalStudyCount ?? 0,
      totalStudyCount: _matching?.ticketCount ?? 0,
    );
  }

  // 남은 사용 가능 티켓 개수
  int get remainingTicketCount {
    final totalTicketCount = _matching?.ticketCount;

    if (totalTicketCount == null) return 0;

    return totalTicketCount - _totalStudyCount;
  }

  // 운동 목표 모델 리스트
  List<ExerciseGoalModel> get exerciseGoals =>
      _matching?.goals
          .map((it) => ExerciseGoalModel(id: it.id, title: it.title))
          .toList() ??
      [];

  // 메모
  String get memo => _matching?.memo ?? "";

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(tabIndex, (_) => refetch());
  }

  refetch() {
    Future.wait([
      fetchMemberInfo(memberId),
      fetchMemberStudies(matchingId),
    ]);
  }
}

// 매칭 삭제 서비스
class MatchingRemoveFeature extends MemberStudiesFetchFeature {
  final RxBool removeMatchingSuccess = RxBool(false);

  removeMatching(int matchingId) async {
    final result = await MatchingApi.remove(matchingId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (removeMatchingSuccess.value = res),
    );
  }
}

// 회원 스터디 목록 조회 서비스
class MemberStudiesFetchFeature extends MemberInfoFetchFeature {
  final Rxn<GetMemberStudiesResponse> fetchMemberStudiesResponse = Rxn();

  List<Items> get memberStudies =>
      fetchMemberStudiesResponse.value?.data.items ?? [];

  Future fetchMemberStudies(int matchingId) async {
    final result = await StudyApi.getMemberStudies(matchingId: matchingId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchMemberStudiesResponse.value = res),
    );
  }
}

// 회원정보 상세 페이지 데이터 조회 서비스
class MemberInfoFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetMemberPageResponse> _fetchMemberPageResponse = Rxn();

  // 개인 일정 여부
  RxBool isPersonalMatching = RxBool(false);

  _setIsPersonalMatching() async {
    final userId = await SharedPrefsManager().getUserId();
    isPersonalMatching.value = (_memberId == userId);
  }

  // 총 스터디 개수
  int get _totalStudyCount =>
      _fetchMemberPageResponse.value?.data.totalStudyCount ?? 0;

  Member? get _member => _fetchMemberPageResponse.value?.data.member;
  int get _memberId => _member?.id ?? 0;

  Matching? get _matching => _fetchMemberPageResponse.value?.data.matching;
  int get matchingId => _matching?.id ?? 0;

  // 가장 최근 스터디
  LatestStudy? get _latestStudy =>
      _fetchMemberPageResponse.value?.data.latestStudy;

  // 다음 스터디 회차
  int get nextStudyRound =>
      _fetchMemberPageResponse.value?.data.nextStudyRound ?? 1;

  Future fetchMemberInfo(int memberId) async {
    final result = await TrainerMemberPageApi.getData(memberId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_fetchMemberPageResponse.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(_fetchMemberPageResponse, (res) => _setIsPersonalMatching());
  }
}
