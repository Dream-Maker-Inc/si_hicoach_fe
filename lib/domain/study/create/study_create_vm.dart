import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/time.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/create_study_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class StudyCreateViewModel extends GetxController {
  int matchingId = 0;
  RxInt latestStudyRound = RxInt(0);
  RxInt totalStudyCount = RxInt(0);

  StudyCreateViewModel(
      {required this.matchingId,
      required int latestStudyRound,
      required int totalStudyCount}) {
    this.latestStudyRound.value = latestStudyRound;
    this.totalStudyCount.value = totalStudyCount;
  }

  Rx<SimpleTime> studyTime = Rx(SimpleTime(hour: 0));
  Rx<EditTimeModel> editTimeModel = Rx(EditTimeModel(
      time: SimpleTime(hour: 0), studyRound: 0, totalStudyCount: 0));
  RxList<ExerciseItem> myExercises = RxList();
  RxList<ExerciseItemModel> exerciseItemModels = RxList();
  RxString memo = RxString('');

  bool get submitButtonDisabled => myExercises.isEmpty;

  addExerciseItem(ExerciseItem exercise) {
    myExercises.add(exercise);
  }

  handleExerciseItemStateChange(int exerciseId,
      {int? weight, int? count, int? sets}) {
    final targetIndex =
        exerciseItemModels.indexWhere((it) => it.id == exerciseId);
    final target = exerciseItemModels[targetIndex];

    if (weight != null) {
      target.weight = weight;
    }

    if (count != null) {
      target.count = count;
    }

    if (sets != null) {
      target.sets = sets;
    }

    exerciseItemModels[targetIndex] = target;
  }

  handleExerciseItemDelete(int exerciseId) {
    exerciseItemModels.removeWhere((it) => it.id == exerciseId);
  }

  // submit
  final RxBool createStudySuccess = RxBool(false);

  Future createStudy() async {
    final myExercisesDto = myExercises.map((it) {
      final exercise = Exercise(title: it.title, part: it.part, type: it.type);

      final exerciseModel =
          exerciseItemModels.firstWhere((el) => el.id == it.id);

      final myExercise = MyExercises(
          interval: exerciseModel.count,
          set: exerciseModel.sets,
          weight: exerciseModel.weight,
          exercise: exercise);

      return myExercise;
    }).toList();

    final dto = CreateStudyDto(
        matchingId: matchingId,
        startedAt: studyTime.value.getLocalDate(),
        endedAt: studyTime.value.getLocalDateOfEndDate(),
        memo: memo.value,
        myExercises: myExercisesDto);

    Logger().i([
      studyTime.value.getLocalDate(),
      studyTime.value.getLocalDateOfEndDate(),
    ]);

    final result = await StudyApi.createStudy(dto);

    result.when(
        (e) => (apiError.value = e), (res) => (createStudySuccess.value = res));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(studyTime, (time) {
      editTimeModel.value = EditTimeModel(
          time: time,
          studyRound: editTimeModel.value.studyRound,
          totalStudyCount: editTimeModel.value.totalStudyCount);
    });

    ever(latestStudyRound, (it) {
      editTimeModel.value = EditTimeModel(
          time: editTimeModel.value.time,
          studyRound: it,
          totalStudyCount: editTimeModel.value.totalStudyCount);
    });

    ever(totalStudyCount, (it) {
      editTimeModel.value = EditTimeModel(
          time: editTimeModel.value.time,
          studyRound: editTimeModel.value.studyRound,
          totalStudyCount: it);
    });

    ever(myExercises, (it) {
      final exercise = it.last;

      final model = ExerciseItemModel(id: exercise.id, name: exercise.title);
      exerciseItemModels.add(model);
    });
  }

  //
  Rx<Exception?> apiError = Rx(null);
}
