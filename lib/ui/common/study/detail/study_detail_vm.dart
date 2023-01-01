import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/common/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_study.response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class StudyDetailViewModel extends _StudyDeleteFeature {
  int studyId = 0;

  StudyDetailViewModel({required this.studyId});

  String get startedDateString => _data?.study.startedAt.toKoreanFormat ?? "";
  String get startedTimeString =>
      _data?.study.startedAt.toKoreanTimeFormat ?? "";
  String get endedTimeSting => _data?.study.endedAt.toKoreanTimeFormat ?? "";
  String get memo => _data?.memo ?? "";

  List<ExerciseItemModel> get exerciseItemModels =>
      _data?.study.myExercises
          .map(
            (it) => ExerciseItemModel(
              id: it.exerciseId,
              name: it.title,
              count: it.interval,
              sets: it.set,
              weight: it.weight,
            ),
          )
          .toList() ??
      [];

  refetch() {
    fetchStudy(studyId);
  }
}

class _StudyDeleteFeature extends _StudyFetchFeature {
  RxBool deleteStudyResponse = RxBool(false);

  Future deleteStudy(int studyId) async {
    final result = await StudyApi.removeStudy(matchingId, studyId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (deleteStudyResponse.value = res),
    );
  }
}

class _StudyFetchFeature extends _MyInfoFetchFeature {
  Rx<Exception?> apiError = Rx(null);
  Rxn<GetStudyResponse> fetchStudyResponse = Rxn();

  Data? get _data => fetchStudyResponse.value?.data;
  int get matchingId => _data?.id ?? 0;

  Future fetchStudy(int studyId) async {
    final result = await StudyApi.findOne(studyId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchStudyResponse.value = res),
    );
  }
}

class _MyInfoFetchFeature extends GetxController {
  RxString userName = RxString("");
  RxInt userId = RxInt(0);

  Future fetchMyInfo() async {
    userName.value = await SharedPrefsManager().getUserName();
    userId.value = await SharedPrefsManager().getUserId();
  }
}
