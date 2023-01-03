import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/policies/my_regex.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/update_password_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class EditPasswordViewModel extends PasswordEditFeature {
  Rx<Exception?> apiError = Rx(null);
  RxBool passwordUpdateSuccess = RxBool(false);

  handleSubmit() async {
    final dto = UpdatePasswordDto(
      oldPassword: oldPassword.value,
      newPassword: newPassword.value,
    );

    final result = await MemberApi.updatePassword(userId, dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (passwordUpdateSuccess.value = res),
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}

class PasswordEditFeature extends UserIdFetchFeature {
  RxString oldPassword = RxString("");
  RxString newPassword = RxString("");
  RxString newPwRepeat = RxString("");

  // 신규 비밀번호가 형식에 맞는지 여부
  bool get isValidNewPw => passwordRegex.hasMatch(newPassword.value);

  String? get newPwValidationMsg => (newPassword.isNotEmpty && !isValidNewPw)
      ? "영문, 특수문자( !@#\$%^&* )를 포함하여 8자 이상의 비밀번호를 설정해 주세요."
      : null;

  // 비밀번호 재확인 일치 여부
  bool get isMatchedNewPw => newPassword.value == newPwRepeat.value;

  String? get newPwRepeatValidationMsg =>
      (newPwRepeat.isNotEmpty && !isMatchedNewPw)
          ? "변경할 비밀번호가 일치하지 않습니다."
          : null;

  // 모든 조건이 패스 됐는지 여부
  bool get isValidAll => isValidNewPw && isMatchedNewPw;
}

class UserIdFetchFeature extends GetxController {
  int userId = 0;

  @override
  Future<void> onInit() async {
    super.onInit();

    userId = await SharedPrefsManager().getUserId();
  }
}
