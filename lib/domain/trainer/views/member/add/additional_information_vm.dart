import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/dto/get_exercise_goal_response.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/exercise_goals_api.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/create_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/dto/get_member_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/trainer_member_api.dart';

class AdditionalInformationViewModel extends GetxController {
  // states
  RxList<CustomChipProps> customChipProps = RxList();
  RxString memo = RxString('');
  RxInt totalTicketCount = RxInt(0);
  RxInt finishedTicketCount = RxInt(0);

  List<CustomChipProps> get selectedChipProps =>
      customChipProps.where((it) => it.isChecked).toList();

  bool get submitButtonDisabled => totalTicketCount.value <= 0;

  handleGoalClick(int id) {
    final targetIndex =
        customChipProps.indexWhere((element) => element.id == id);
    final target = customChipProps[targetIndex];

    target.isChecked = !target.isChecked;

    customChipProps[targetIndex] = target;
  }

  //
  Rx<Exception?> apiError = Rx(null);

  // fetch member
  final Rxn<GetMemberResponse> _fetchMemberResponse = Rxn();
  Rx<bool> fetchMemberSuccess = Rx(false);

  String get memberName => _fetchMemberResponse.value?.data.member.name ?? '';

  fetchMember(int memberId) async {
    final result = await TrainerMemberApi.findOne(memberId);

    result.when((e) => (apiError.value = e), (response) {
      _fetchMemberResponse.value = response;
      fetchMemberSuccess.value = true;
    });
  }

  // fetch goals
  Rx<bool> fetchGoalsSuccess = Rx(false);

  final Rxn<GetExerciseGoalResponse> _fetchGoalsResponse = Rxn();

  List<Items> get goals => _fetchGoalsResponse.value?.data.items ?? [];

  fetchGoals() async {
    final result = await ExerciseGoalsApi.findAll();

    result.when((e) => (apiError.value = e),
        (response) => (_fetchGoalsResponse.value = response));
  }

  // create matching
  Rx<bool> createMatchingSuccess = Rx(false);
  String matchingSuccessMsg = "회원을 추가 했습니다.";

  createMatching(int memberId) async {
    final selectedGoals = selectedChipProps.map((it) => it.label).toList();

    final dto = CreateMatchingDto(
        memberId: memberId,
        goals: selectedGoals,
        memo: memo.value,
        totalTicketCount: totalTicketCount.value,
        finishedTicketCount: finishedTicketCount.value);

    final result = await MatchingApi.create(dto);

    result.when((e) => (apiError.value = e),
        (response) => (createMatchingSuccess.value = true));
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(_fetchGoalsResponse, (res) {
      if (res != null) _handleFetchGoalsSuccess(res);
    });
  }

  _handleFetchGoalsSuccess(GetExerciseGoalResponse res) {
    customChipProps.value =
        goals.map((it) => CustomChipProps(it.id, it.title, false)).toList();

    fetchGoalsSuccess.value = true;
  }

  clear() {
    fetchGoalsSuccess.value = false;
    apiError.value = null;
  }
}
