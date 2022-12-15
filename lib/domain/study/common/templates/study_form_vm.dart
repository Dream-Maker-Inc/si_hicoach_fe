import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/time.dart';
import 'package:si_hicoach_fe/domain/study/common/templates/study_form_model.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';

class StudyFormViewModel extends GetxController {
  Rxn<StudyFormModel> initialStudyFormModel = Rxn();

  // 스터디 생성 날짜
  Rx<DateTime> targetDate = Rx(DateTime.now());

  // 다음 스터디 회차
  RxInt nextStudyRound = RxInt(0);

  // 총 스터디 횟수
  RxInt totalStudyCount = RxInt(0);

  // 스터디 시간
  Rx<SimpleTime> studyTime = Rx(SimpleTime(hour: 0));

  setStudyTime(int hour) {
    studyTime.value = SimpleTime(date: studyTime.value.date, hour: hour);
  }

  Rx<EditTimeModel> editTimeModel = Rx(EditTimeModel(
      time: SimpleTime(hour: 0), studyRound: 0, totalStudyCount: 0));

  // 내 운동 목록
  RxList<ExerciseItem> myExercises = RxList();

  // 운동 아이템 모델 목록
  RxList<ExerciseItemModel> exerciseItemModels = RxList();

  RxnString memo = RxnString();

  bool get submitButtonDisabled => exerciseItemModels.isEmpty;

  // 내 운동 목록에 아이템 추가
  addExerciseItem(ExerciseItem exercise) {
    myExercises.add(exercise);
  }

  // 내 운동 아이템 상태 변경
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

  // 내 운동 아이템 삭제
  handleExerciseItemDelete(int exerciseId) {
    final target = exerciseItemModels.lastWhere((it) => it.id == exerciseId);
    exerciseItemModels.remove(target);
  }

  // submit
  Future submit() async {}

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(targetDate, (date) {
      studyTime.value = SimpleTime(date: date, hour: 0);
      editTimeModel.value = EditTimeModel(
          time: SimpleTime(date: date, hour: 0),
          studyRound: 0,
          totalStudyCount: 0);
    });

    ever(studyTime, (time) {
      editTimeModel.value = EditTimeModel(
          time: time,
          studyRound: editTimeModel.value.studyRound,
          totalStudyCount: editTimeModel.value.totalStudyCount);
    });

    ever(nextStudyRound, (it) {
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

    ever(initialStudyFormModel, (_) => _handleInitStudyForm());
  }

  // 폼 초기 데이터 세팅 (Update 화면용)
  _handleInitStudyForm() {
    if (initialStudyFormModel.value == null) return;

    final fm = initialStudyFormModel.value!;

    nextStudyRound.value = fm.studyRound;
    totalStudyCount.value = fm.ticketCount;
    studyTime.value = SimpleTime(date: fm.startedAt, hour: fm.startedHour);
    exerciseItemModels.value = fm.exerciseItemModels;
    memo.value = fm.memo;
  }
}
