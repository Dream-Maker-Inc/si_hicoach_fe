// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/dto/get_exercise_goal_response.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/exercise_goals_api.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart'
    as MatchingResponse;
import 'package:si_hicoach_fe/infrastructure/matching/dto/update_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';

class PurposeEditViewModel extends _FetchController {
  RxList<CustomChipProps> customChipProps = RxList();

  List<CustomChipProps> get selectedChipProps =>
      customChipProps.where((it) => it.isChecked).toList();

  handleGoalClick(int id) {
    final targetIndex =
        customChipProps.indexWhere((element) => element.id == id);
    final target = customChipProps[targetIndex];

    target.isChecked = !target.isChecked;

    customChipProps[targetIndex] = target;
  }

  // update matching goal
  final RxBool updateMatchingSuccess = RxBool(false);

  handleSubmit() async {
    int matchingId = matching?.id ?? 0;

    final goals = selectedChipProps.map((it) => it.label).toList();
    final dto = UpdateMatchingDto(goals: goals);

    final result = await MatchingApi.update(matchingId, dto);

    result.when((e) => (apiError.value = e),
        (res) => (updateMatchingSuccess.value = res));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(_fetchGoalsResponse,
        (res) => (res != null) && _handleFetchGoalsSuccess(res));

    ever(_fetchMatchingResponse,
        (res) => (res != null) && _handleFetchMatchingSuccess(res));

    ever(apiError, (e) => apiError.value = null);
  }

  _handleFetchGoalsSuccess(GetExerciseGoalResponse res) {
    customChipProps.value =
        goals.map((it) => CustomChipProps(it.id, it.title, false)).toList();
  }

  _handleFetchMatchingSuccess(MatchingResponse.GetMatchingResponse res) {
    final oldGoalIds = oldGoals.map((it) => it.id);

    final newChipProps = customChipProps.map((it) {
      it.isChecked = oldGoalIds.any((oldGoalId) => oldGoalId == it.id);
      return it;
    }).toList();

    customChipProps.value = newChipProps;
  }
}

class _FetchController extends GetxController {
  //
  Rx<Exception?> apiError = Rx(null);

  // fetch goals
  final Rxn<GetExerciseGoalResponse> _fetchGoalsResponse = Rxn();

  List<Items> get goals => _fetchGoalsResponse.value?.data.items ?? [];

  Future<void> fetchGoals() async {
    final result = await ExerciseGoalsApi.findAll();

    result.when((e) => (apiError.value = e),
        (response) => (_fetchGoalsResponse.value = response));
  }

  // fetch matching
  final Rxn<MatchingResponse.GetMatchingResponse> _fetchMatchingResponse =
      Rxn();

  MatchingResponse.Data? get matching => _fetchMatchingResponse.value?.data;

  List<MatchingResponse.Goals> get oldGoals => matching?.goals ?? [];

  Future<void> fetchMatching(int matchingId) async {
    final result = await MatchingApi.findOne(matchingId);

    result.when((e) => (apiError.value = e),
        (response) => (_fetchMatchingResponse.value = response));
  }
}
