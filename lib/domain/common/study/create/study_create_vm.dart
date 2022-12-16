import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/common/study/common/templates/study_form_vm.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/mutation/mutate_study_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class StudyCreateViewModel extends StudyFormViewModel {
  int matchingId = 0;

  StudyCreateViewModel({required this.matchingId});

  //
  Rx<Exception?> apiError = Rx(null);

  //
  final RxBool createStudySuccess = RxBool(false);

  Future createStudy() async {
    final myExercisesDto = myExercises.map((it) {
      final exerciseModel =
          exerciseItemModels.firstWhere((el) => el.id == it.id);

      final myExercise = MyExercises(
          interval: exerciseModel.count,
          set: exerciseModel.sets,
          weight: exerciseModel.weight,
          exerciseId: exerciseModel.id);

      return myExercise;
    }).toList();

    final dto = CreateStudyDto(
        matchingId: matchingId,
        startedAt: studyTime.value.getLocalDate(),
        endedAt: studyTime.value.getLocalDateOfEndDate(),
        memo: memo.value ?? "",
        myExercises: myExercisesDto);

    final result = await StudyApi.createStudy(dto);

    result.when(
        (e) => (apiError.value = e), (res) => (createStudySuccess.value = res));
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    memo.value = "";
  }

  @override
  Future submit() => createStudy();
}
