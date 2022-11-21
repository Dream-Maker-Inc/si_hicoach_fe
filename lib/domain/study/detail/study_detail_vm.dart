import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_study.response.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class StudyDetailViewModel extends _FetchController {
  int studyId = 0;

  StudyDetailViewModel({required this.studyId});

  //
  String get memberName => member?.name ?? "";
  String get startedDateString => study?.startedDate.toKoreanFormat ?? "";
  String get startedTimeString => study?.startedDate.toKoreanTimeFormat ?? "";
  String get endedTimeSting => study?.endedDate.toKoreanTimeFormat ?? "";
  List<ExerciseItemModel> get exerciseItemModels =>
      study?.myExercises
          .map((it) => ExerciseItemModel(
              id: it.exercise.id,
              name: it.exercise.title,
              count: it.interval,
              sets: it.set,
              weight: it.weight))
          .toList() ??
      [];
  String get memo => study?.memo ?? "";

  //
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // fetch
  Rxn<GetStudyResponse> fetchStudyResponse = Rxn();
  Member? get member => fetchStudyResponse.value?.data.member;
  Study? get study => fetchStudyResponse.value?.data.study;

  Future fetchStudy(int studyId) async {
    final result = await StudyApi.findOne(studyId);

    result.when(
        (e) => (apiError.value = e), (res) => (fetchStudyResponse.value = res));
  }
}
