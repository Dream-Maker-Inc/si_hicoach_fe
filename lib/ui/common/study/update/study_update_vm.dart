import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/common/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form_model.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form_vm.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_study.response.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/mutation/mutate_study_dto.dart'
    as mutate;
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class StudyUpdateViewModel extends OldStudyFetchFeature {
  int studyId = 0;

  StudyUpdateViewModel({required this.studyId});

  List<mutate.MyExercises> get myExercisesDto => exerciseItemModels
      .map(
        (model) => mutate.MyExercises(
          interval: model.count,
          set: model.sets,
          weight: model.weight,
          exerciseId: model.id,
        ),
      )
      .toList();

  final RxBool updateStudySuccess = RxBool(false);

  Future updateStudy() async {
    final dto = mutate.UpdateStudyDto(
      startedAt: studyTime.value.getLocalDate(),
      endedAt: studyTime.value.getLocalDateOfEndDate(),
      memo: memo.value ?? "",
      myExercises: myExercisesDto,
    );

    final result = await StudyApi.updateStudy(matchingId, studyId, dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (updateStudySuccess.value = res),
    );
  }

  @override
  Future submit() async {
    updateStudy();
  }
}

class OldStudyFetchFeature extends StudyFormViewModel {
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

  @override
  onInit() {
    ever(
      fetchStudyResponse,
      (res) => _handleFetchStudyResponse(res),
    );

    return super.onInit();
  }

  _handleFetchStudyResponse(GetStudyResponse? res) {
    if (res == null) return;

    final matching = res.data;
    final study = matching.study;

    final exerciseItemModels = study.myExercises
        .map(
          (it) => ExerciseItemModel(
            id: it.exerciseId,
            name: it.title,
            count: it.interval,
            sets: it.set,
            weight: it.weight,
          ),
        )
        .toList();

    final fm = StudyFormModel(
      studyRound: study.round,
      ticketCount: matching.totalTicketCount,
      startedAt: study.startedAt,
      exerciseItemModels: exerciseItemModels,
      memo: study.memo,
    );

    super.initialStudyFormModel(fm);
  }
}
