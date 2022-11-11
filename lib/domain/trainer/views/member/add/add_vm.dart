import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/data/dto/get_member_of_trainer_response.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/data/member_api.dart';

class TrainerMemberAddViewModel extends GetxController {
  RxString email = RxString('');

  final RxnBool _isExistMember = RxnBool(null);
  RxBool isExistMatching = RxBool(false);

  String memberName = '';

  bool get isExistMember =>
      !(_isExistMember.value == null || _isExistMember.value == false);

  String? get validationErrorText =>
      (_isExistMember.value != null && _isExistMember.value == false)
          ? "회원 정보가 없습니다."
          : null;

  String? get validationSuccessText =>
      _isExistMember.value == true ? "$memberName님 확인되었습니다." : null;

  Rx<bool> getMemberSuccess = Rx(false);
  Rx<Exception?> getMemberError = Rx(null);

  getMember() async {
    final result = await TrainerMemberApi.getMemberOfTrainer(email.value);

    result.when((e) => _handleGetMemberError(e),
        (response) => _handleGetMemberSuccess(response));
  }

  _handleGetMemberError(Exception? e) {
    if (e is NotExistException) return _isExistMember.value = false;

    getMemberError.value = e;
  }

  _handleGetMemberSuccess(GetMemberOfTrainerResponse res) {
    final data = res.data;

    isExistMatching.value = data?.matching != null;
    _isExistMember.value = data?.member != null;
    memberName = data?.member.name ?? '';
    getMemberSuccess.value = true;
  }

  clear() {
    _isExistMember.value = null;
    isExistMatching.value = false;
    getMemberSuccess.value = false;
    getMemberError.value = null;
  }

  @override
  void onInit() {
    super.onInit();

    ever(email, _handleEmailChange);
  }

  _handleEmailChange(String email) {
    _isExistMember.value = null;
    isExistMatching.value = false;
  }
}
