import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/member/studies/models/study_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_studies/dto/get_member_my_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_studies/member_my_studies_api.dart';
import 'package:collection/collection.dart';

class MemberMyStudiesViewModel extends _MemberMyStudiesFetchFeature {
  List<StudyModel> get studyModels {
    final data = this.data;

    if (data == null) return [];

    // 운동 시작 시간 기준 DESC 정렬
    final studies = data
        .expand((it) => it.studies)
        .sorted((a, b) => a.startedAt.millisecond - b.startedAt.millisecond);

    final result = studies
        .map(
          (it) => StudyModel(
            id: it.id,
            round: it.round,
            startedAt: it.startedAt,
            endedAt: it.endedAt,
            isPersonal: isPersonalMatching(it.matchingId),
          ),
        )
        .toList();

    return result;
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}

// 내 스터디 목록 불러오기
class _MemberMyStudiesFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetMemberMyStudiesResponse> fetchResponse = Rxn();
  List<Data>? get data => fetchResponse.value?.data;

  // 개인 일정용 매칭
  Data? get personalMatching => data?.firstWhere((it) => it.isPersonal);

  // 개인 일정용 매칭 id
  int get personalMatchingId => personalMatching?.id ?? 0;

  // 가장 최근 개인 운동 일지 회차
  int get _latestPersonalStudyRound {
    final personalMatching = this.personalMatching;

    if (personalMatching == null) return 0;

    return personalMatching.studies
            .sorted((a, b) => a.round - b.round)
            .lastOrNull
            ?.round ??
        personalMatching.totalStudyCount;
  }

  // 다음에 생성할 개인 운동 일지 회차
  int get nextPersonalStudyRound => _latestPersonalStudyRound + 1;

  // 총 개인 일정용 매칭 수강권 개수 (사용한 것 포함)
  int get totalPersonalTicketCount => personalMatching?.totalTicketCount ?? 0;

  // 해당 매칭이 개인 일정용 매칭인지
  bool isPersonalMatching(int matchingId) {
    final data = this.data;

    if (data == null) return false;

    return data.firstWhere((e) => e.id == matchingId).isPersonal;
  }

  Future fetchData() async {
    final result = await MyMemberStudiesApi.getData();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchResponse.value = res),
    );
  }

  refetch() {
    fetchData();
  }
}
