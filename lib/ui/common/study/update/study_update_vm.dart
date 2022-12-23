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

    final result = await StudyApi.updateStudy(studyId, dto);

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

  Member? get member => fetchStudyResponse.value?.data.member;
  Study? get study => fetchStudyResponse.value?.data.study;

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

    final study = res.data.study;
    final matching = res.data.matching;

    final exerciseItemModels = study.myExercises
        .map(
          (it) => ExerciseItemModel(
            id: it.exercise.id,
            name: it.exercise.title,
            count: it.interval,
            sets: it.set,
            weight: it.weight,
          ),
        )
        .toList();

    final fm = StudyFormModel(
      studyRound: study.round,
      ticketCount: matching.ticketCount,
      startedAt: study.startedDate,
      exerciseItemModels: exerciseItemModels,
      memo: study.memo,
    );

    super.initialStudyFormModel(fm);
  }
}
