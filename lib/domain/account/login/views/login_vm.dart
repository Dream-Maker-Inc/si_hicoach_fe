import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/login_response.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/request_login_dto.dart';
import 'package:si_hicoach_fe/infrastructure/login/login_api.dart';
import 'package:si_hicoach_fe/domain/member/data/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/domain/member/data/member_api.dart';

class LoginViewModel extends GetxController {
  RxString email = RxString('');
  RxString password = RxString('');

  bool get buttonDisabled => email.isEmpty || password.isEmpty;

  RxnBool isRoleTrainer = RxnBool(null);

  Rx<bool> loginSuccess = Rx(false);
  Rx<Exception?> loginError = Rx(null);

  submit() async {
    final dto = RequestLoginDto(email: email.value, password: password.value);
    final result = await LoginApi.login(dto);

    result.when((e) => loginError.value = e,
        (response) => _handleLoginSuccess(response));
  }

  clear() {
    isRoleTrainer.value = null;
    loginSuccess.value = false;
    loginError.value = null;
  }

  _handleLoginSuccess(LoginResponse res) async {
    final accessToken = res.data?.accessToken ?? '';
    await _saveAccessTokenToDevice(accessToken);
    await _getMyInfo();

    loginSuccess.value = true;
  }

  _saveAccessTokenToDevice(accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsKeys.accessToken.key, accessToken);
  }

  _getMyInfo() async {
    final result = await MemberApi.getMyInfo();

    result.when((e) => loginError.value = e,
        (response) => _handleGetMyInfoSuccess(response));
  }

  _handleGetMyInfoSuccess(GetMyInfoResponse res) {
    final trainerInfo = res.data?.member.trainerInfo;

    isRoleTrainer.value = (trainerInfo != null);
  }
}
