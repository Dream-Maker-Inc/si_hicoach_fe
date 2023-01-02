// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/models/exercise_goal_model.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/models/latest_study_model.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/models/member_model.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/member/dto/get_member_page_response.dart'
    as MemberPage;
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
    final study = _latestStudy;

    if (study == null) {
      return LatestStudyModel(
        id: 0,
        round: 0,
        startedAt: "",
        finishedStudyCount: 0,
        totalStudyCount: 0,
      );
    }

    return LatestStudyModel(
      id: study.id,
      round: study.round,
      startedAt: study.startedAt.toKoreanFormat,
      finishedStudyCount: _matching?.totalStudyCount ?? 0,
      totalStudyCount: _matching?.totalStudyCount ?? 0,
    );
  }

  // 남은 사용 가능 티켓 개수
  int get remainingTicketCount {
    final totalTicketCount = _matching?.totalTicketCount;

    if (totalTicketCount == null) return 0;

    return totalTicketCount - _totalStudyCount;
  }

  // 운동 목표 모델 리스트
  List<ExerciseGoalModel> get exerciseGoals =>
      _matching?.exerciseGoals
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

  final Rxn<MemberPage.GetMemberPageResponse> _fetchMemberPageResponse = Rxn();

  MemberPage.Member? get _member => _fetchMemberPageResponse.value?.data.member;

  MemberPage.Data? get _matching => _fetchMemberPageResponse.value?.data;
  int get matchingId => _matching?.id ?? 0;

  // 가장 최근 스터디
  MemberPage.LatestStudy? get _latestStudy =>
      _fetchMemberPageResponse.value?.data.latestStudy;

  // 총 스터디 개수
  int get _totalStudyCount => _matching?.totalStudyCount ?? 0;

  // 다음 스터디 회차
  int get nextStudyRound => _matching?.nextStudyRound ?? 1;

  // 개인 일정 여부
  bool get isPersonalMatching2 => _matching?.isPersonal ?? true;

  Future fetchMemberInfo(int memberId) async {
    final result = await TrainerMemberPageApi.getData(memberId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_fetchMemberPageResponse.value = res),
    );
  }
}
