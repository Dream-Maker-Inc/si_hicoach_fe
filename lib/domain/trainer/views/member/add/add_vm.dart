import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/dto/get_member_of_trainer_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/trainer_member_api.dart';

class TrainerMemberAddViewModel extends GetxController {
  final Rxn<GetMemberOfTrainerResponse> _getMemberResponse = Rxn();

  Data? get data => _getMemberResponse.value?.data;

  bool get isExistMatching => data?.matching != null;

  bool get isExistPastMatching => data?.matching?.isPast ?? false;

  bool get isExistMember => data?.member != null;

  int get matchingId => data?.matching?.id ?? 0;

  int get memberId => data?.member.id ?? 0;

  String get memberName => data?.member.name ?? '';

  //
  int userId = 0;

  bool get targetIsSameUser => (userId == data?.member.id);

  //
  RxString email = RxString('');

  //
  String? get validationErrorText {
    if (data == null) return null;

    if (!isExistMember) return "회원 정보가 없습니다.";

    return null;
  }

  String? get validationSuccessText {
    if (isExistPastMatching) return "($memberName님)\n과거 매칭 내역이 있는 회원입니다.";
    if (isExistMatching) return "($memberName님)\n이미 매칭된 회원입니다.";
    if (isExistMember) return "$memberName님 확인되었습니다.";

    return null;
  }

  //
  String get buttonText => isExistMatching ? "매칭 복구" : "다음";

  bool get submitButtonDisabled =>
      !isExistMember || (isExistMatching && !isExistPastMatching);

  //
  Rx<bool> getMemberSuccess = Rx(false);
  Rx<bool> recoverMatchingSuccess = Rx(false);
  Rx<Exception?> apiError = Rx(null);

  String get recoverSuccessMessage => "$memberName님과 다시 매칭 되었습니다.";

  getMember() async {
    final result = await TrainerMemberApi.getMemberOfTrainer(email.value);

    result.when((e) => (apiError.value = e),
        (response) => (_getMemberResponse.value = response));
  }

  recoverMatching(int matchingId) async {
    final result = await MatchingApi.recover(matchingId);

    result.when((e) => (apiError.value = e),
        (response) => (recoverMatchingSuccess.value = true));
  }

  //
  clear() {
    _getMemberResponse.value = null;
    getMemberSuccess.value = false;
    recoverMatchingSuccess.value = false;
    apiError.value = null;
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    await _initUserId();

    ever(email, _handleEmailChange);
    ever(_getMemberResponse, (res) {
      if (res != null) _handleGetMemberSuccess(res);
    });
  }

  _initUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }

  _handleEmailChange(String email) {
    _getMemberResponse.value = null;
  }

  _handleGetMemberSuccess(GetMemberOfTrainerResponse res) async {
    if (targetIsSameUser) {
      apiError.value = SameUserException();
      return;
    }

    getMemberSuccess.value = true;
  }
}
