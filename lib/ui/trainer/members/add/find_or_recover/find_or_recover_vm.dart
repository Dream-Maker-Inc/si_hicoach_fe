import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/infrastructure/matching/matching_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/dto/get_member_of_trainer_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/trainer_member_api.dart';

class TrainerMemberFindOrRecoverViewModel extends MemberRecoverFeature {
  // 제출 버튼 비활성화 조건
  // 1. 멤버가 존재하지 않는다.
  // 2. 검색된 멤버와 현재 트레이너가 이미 매칭되어 있다.
  bool get submitButtonDisabled =>
      !_isExistMember || (isExistMatching && !isExistPastMatching);

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(email, (_) => (memberFetchResponse.value = null));
    ever(memberFetchResponse, (res) {
      if (res == null) return;

      _handleGetMemberSuccess(res);
    });
  }

  _handleGetMemberSuccess(GetMemberOfTrainerResponse res) async {
    if (await isSearchTargetSameUser()) {
      apiError.value = SameUserException();
    }
  }

  // 검색된 멤버가 트레이너 본인인지
  isSearchTargetSameUser() async {
    final localUserId = await SharedPrefsManager().getUserId();
    return localUserId == memberId;
  }
}

// 멤버와 기존 매칭 복구 서비스
class MemberRecoverFeature extends MemberFetchFeature {
  Rx<bool> matchingRecoverSuccess = Rx(false);

  recoverMatching(int matchingId) async {
    final result = await MatchingApi.recover(matchingId);

    result.when(
      (e) => (apiError.value = e),
      (response) => (matchingRecoverSuccess.value = true),
    );
  }
}

// 멤버 조회 서비스
class MemberFetchFeature extends BaseMemberAddViewModel {
  Rx<bool> memberFetchSuccess = Rx(false);
  final Rxn<GetMemberOfTrainerResponse> memberFetchResponse = Rxn();

  Data? get _data => memberFetchResponse.value?.data;
  Matching? get _matching => _data?.matching;
  Member? get _member => _data?.member;

  // 검색된 멤버가 존재하는지
  bool get _isExistMember => _member != null;

  // 검색된 멤버 id
  int get memberId => _member?.id ?? 0;

  // 검색된 멤버 이름
  String get memberName => _member?.name ?? '';

  // 매칭 id
  int get matchingId => _matching?.id ?? 0;

  // 매칭 존재 여부
  bool get isExistMatching => _matching != null;

  // 검색된 멤버와 현재 트레이너간에 예전 매칭 내역이 있는지
  bool get isExistPastMatching => _matching?.isPast ?? false;

  fetchMember(String email) async {
    final result = await TrainerMemberApi.getMemberWithMatching(email);

    result.when(
      (e) => (apiError.value = e),
      (response) => (memberFetchResponse.value = response),
    );
  }
}

class BaseMemberAddViewModel extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  RxString email = RxString('');
}
