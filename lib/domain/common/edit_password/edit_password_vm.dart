import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/policies/my_regex.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/update_password_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class EditPasswordViewModel extends GetxController {
  int userId = 0;

  RxString oldPassword = "".obs;
  RxString newPassword = "".obs;
  RxString newPwRepeat = "".obs;

  bool get isValidNewPw => passwordRegex.hasMatch(newPassword.value);

  String? get newPwValidationMsg => (newPassword.isNotEmpty && !isValidNewPw)
      ? "영문, 특수문자를 포함하여 8자 이상의 비밀번호를 설정해 주세요."
      : null;

  bool get isMatchedNewPw => newPassword.value == newPwRepeat.value;

  String? get newPwRepeatValidationMsg =>
      (newPwRepeat.isNotEmpty && !isMatchedNewPw)
          ? "변경할 비밀번호가 일치하지 않습니다."
          : null;

  bool get isValidAll => isValidNewPw && isMatchedNewPw;

  //
  RxBool updatePasswordSuccess = false.obs;

  handleSubmit() async {
    final dto = UpdatePasswordDto(
        oldPassword: oldPassword.value, newPassword: newPassword.value);

    final result = await MemberApi.updatePassword(userId, dto);

    result.when((e) => (apiError.value = e),
        (response) => (updatePasswordSuccess.value = response));
  }

  //
  Rx<Exception?> apiError = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    await _initUserId();
  }

  _initUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}
