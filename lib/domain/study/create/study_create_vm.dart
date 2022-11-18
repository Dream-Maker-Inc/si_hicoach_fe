import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/time.dart';

class StudyCreateViewModel extends GetxController {
  Rx<SimpleTime> studyTime = Rx(SimpleTime(hour: 0));
  Rx<EditTimeModel> editTimeModel = Rx(EditTimeModel(
      time: SimpleTime(hour: 0), studyRound: 0, totalStudyCount: 0));
  RxList<ExerciseItemModel> exerciseItemModels = RxList();
  RxString memo = RxString('');

  addExerciseItem(int exerciseId, String exerciseTitle) {
    final model = ExerciseItemModel(id: exerciseId, name: exerciseTitle);
    exerciseItemModels.add(model);
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
  }

  //
  Rx<Exception?> apiError = Rx(null);
}
