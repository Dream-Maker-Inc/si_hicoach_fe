import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/member/views/studies/study_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_studies/dto/get_member_my_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_studies/member_my_studies_api.dart';
import 'package:collection/collection.dart';

class MemberMyStudiesViewModel extends _FetchController {
  List<StudyModel> get studyModels {
    if (data == null) return [];

    final safeData = data!;

    final studies = safeData
        .expand((it) => it.studies)
        .sorted((a, b) => a.startedAt.millisecond - b.startedAt.millisecond);

    findMatching(int matchingId) =>
        safeData.firstWhere((e) => e.id == matchingId);

    final result = studies
        .map((e) => StudyModel(
            id: e.id,
            round: e.round,
            startedAt: e.startedAt,
            endedAt: e.endedAt,
            isPersonal: findMatching(e.matchingId).isPersonal))
        .toList();

    return result;
  }

  int get matchingId => personalMatching?.id ?? 0;

  int get _latestStudyRound {
    if (personalMatching == null) return 0;

    return personalMatching!.studies
            .sorted((a, b) => a.round - b.round)
            .lastOrNull
            ?.round ??
        personalMatching!.totalStudyCount;
  }

  int get nextStudyRound => _latestStudyRound + 1;

  int get totalTicketCount => personalMatching?.ticketCount ?? 0;
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // fetch data
  final Rxn<GetMemberMyStudiesResponse> fetchResponse = Rxn();
  List<Data>? get data => fetchResponse.value?.data;
  Data? get personalMatching => data?.firstWhere((e) => e.isPersonal);

  Future fetchData() async {
    final result = await MyMemberStudiesApi.getData();

    result.when(
        (e) => (apiError.value = e), (res) => (fetchResponse.value = res));
  }

  refetch() {
    fetchData();
  }
}
