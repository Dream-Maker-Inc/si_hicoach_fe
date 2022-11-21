import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/time.dart';
import 'package:si_hicoach_fe/domain/study/common/templates/study_form_model.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';

class StudyFormViewModel extends GetxController {
  final StudyFormModel? initialStudyFormModel;

  StudyFormViewModel({this.initialStudyFormModel});

  RxInt latestStudyRound = RxInt(0);
  RxInt totalStudyCount = RxInt(0);

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
  Future submit() async {}

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

    _ifExistInitDataThenSet();
  }

  _ifExistInitDataThenSet() {
    if (initialStudyFormModel == null) return;

    final fm = initialStudyFormModel!;

    latestStudyRound.value = fm.latestStudyRound;
    totalStudyCount.value = fm.totalStudyCount;
    studyTime.value = SimpleTime(hour: fm.startedHour);
    exerciseItemModels.value = fm.exerciseItemModels;
    memo.value = fm.memo;
  }
}
