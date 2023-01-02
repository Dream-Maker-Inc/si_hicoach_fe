import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/dto/get_exercise_goal_response.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/exercise_goals_api.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/create_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/dto/get_member_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/trainer_member_api.dart';

class MatchingCreateViewModel extends MatchingCreateFeature {}

// 매칭 생성 서비스
class MatchingCreateFeature extends ExerciseGoalCheckFeature {
  Rx<bool> createMatchingSuccess = Rx(false);

  createMatching(int memberId) async {
    final selectedGoalIds = checkedChipProps.map((it) => it.id).toList();

    final dto = CreateMatchingDto(
      memberId: memberId,
      goals: selectedGoalIds,
      memo: memo.value,
      totalTicketCount: totalTicketCount.value,
      finishedTicketCount: finishedTicketCount.value,
    );

    final result = await MatchingApi.create(dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (createMatchingSuccess.value = res),
    );
  }
}

// 운동 목표 항목 체크 상태 관리 서비스
class ExerciseGoalCheckFeature extends ExerciseGoalsFetchFeature {
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
class ExerciseGoalsFetchFeature extends MemberFetchFeature {
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

// 멤버 정보 불러오기 서비스
class MemberFetchFeature extends BaseMatchingCreateViewModel {
  final Rxn<GetMemberResponse> _fetchMemberResponse = Rxn();

  String get memberName => _fetchMemberResponse.value?.data.member.name ?? '';

  Future fetchMember(int memberId) async {
    final result = await TrainerMemberApi.findOne(memberId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_fetchMemberResponse.value = res),
    );
  }
}

class BaseMatchingCreateViewModel extends GetxController {
  RxString memo = RxString('');
  RxInt totalTicketCount = RxInt(0);
  RxInt finishedTicketCount = RxInt(0);

  bool get submitButtonDisabled => totalTicketCount.value <= 0;

  Rx<Exception?> apiError = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}
