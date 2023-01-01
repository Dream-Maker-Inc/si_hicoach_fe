// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/dto/get_exercise_goal_response.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/exercise_goals_api.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart'
    as MatchingResponse;
import 'package:si_hicoach_fe/infrastructure/matching/dto/update_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';

class ExerciseGoalsUpdateViewModel extends ExerciseGoalsUpdateFeature {}

class ExerciseGoalsUpdateFeature extends _MatchingFetchFeature {
  final RxBool updateMatchingSuccess = RxBool(false);

  handleSubmit() async {
    final goals = checkedChipProps.map((it) => it.label).toList();
    final dto = UpdateMatchingDto(goals: goals);

    final result = await MatchingApi.update(_matchingId, dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (updateMatchingSuccess.value = res),
    );
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(apiError, (e) => apiError.value = null);
  }
}

// 멤버 정보 불러오기 서비스
class _MatchingFetchFeature extends ExerciseGoalsCheckFeature {
  final Rxn<MatchingResponse.GetMatchingResponse> _fetchMatchingResponse =
      Rxn();

  MatchingResponse.Data? get matching => _fetchMatchingResponse.value?.data;
  int get _matchingId => matching?.id ?? 0;

  List<MatchingResponse.ExerciseGoals> get oldGoals =>
      matching?.exerciseGoals ?? [];
  List<int> get oldGoalIds => oldGoals.map((it) => it.id).toList();

  Future fetchMatching(int matchingId) async {
    final result = await MatchingApi.findOne(matchingId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_fetchMatchingResponse.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(_fetchMatchingResponse, (_) {
      checkedGoalIds.value = [...checkedGoalIds, ...oldGoalIds];
    });
  }
}

// 운동 목표 항목 체크 상태 관리 서비스
class ExerciseGoalsCheckFeature extends _ExerciseGoalsFetchFeature {
  List<int> get goalIds => _goals.map((it) => it.id).toList();

  // 체크된 운동 목표 id 목록
  RxList<int> checkedGoalIds = RxList();

  // 운동 목표 칩 모델 목록
  List<CustomChipProps> get customChipProps => _goals
      .map(
        (it) => CustomChipProps(
          it.id,
          it.title,
          getGoalChecked(it.id),
        ),
      )
      .toList();

  // 체크된 운동 목표 칩 모델 목록
  List<CustomChipProps> get checkedChipProps =>
      customChipProps.where((it) => it.isChecked).toList();

  // goalId가 체크된 상태인지
  getGoalChecked(int goalId) {
    final old = checkedGoalIds.firstWhereOrNull(
      (checkedId) => checkedId == goalId,
    );

    return old != null;
  }

  // goalId 체크 상태 토글
  toggleGoalChecked(int goalId) {
    final old = checkedGoalIds.firstWhereOrNull(
      (checkedId) => checkedId == goalId,
    );

    if (old == null) {
      return checkedGoalIds.add(goalId);
    }

    checkedGoalIds.removeWhere((checkedId) => checkedId == goalId);
  }
}

// 운동 목표 항목 불러오기 서비스
class _ExerciseGoalsFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);
  final Rxn<GetExerciseGoalResponse> _fetchGoalsResponse = Rxn();

  List<Items> get _goals => _fetchGoalsResponse.value?.data.items ?? [];

  Future fetchGoals() async {
    final result = await ExerciseGoalsApi.findAll();

    result.when(
      (e) => (apiError.value = e),
      (res) => (_fetchGoalsResponse.value = res),
    );
  }
}
