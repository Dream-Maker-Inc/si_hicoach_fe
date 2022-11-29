import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/common/utils/device_info/device_info.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/login_response.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/request_login_dto.dart';
import 'package:si_hicoach_fe/infrastructure/login/login_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/dto/add_device_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/member_devices_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class LoginViewModel extends GetxController {
  RxString email = RxString('admin@gmail.com');
  RxString password = RxString('asdasd123!!');

  bool get buttonDisabled => email.isEmpty || password.isEmpty;

  RxnBool isRoleTrainer = RxnBool(null);

  final Rx<bool> _loginSuccess = Rx(false);
  Rx<bool> addDeviceSuccess = Rx(false);
  Rx<Exception?> apiError = Rx(null);

  submit() async {
    final dto = RequestLoginDto(email: email.value, password: password.value);
    final result = await LoginApi.login(dto);

    result.when((e) => apiError.value = e,
        (response) async => await _handleLoginSuccess(response));
  }

  clear() {
    isRoleTrainer.value = null;
    _loginSuccess.value = false;
    addDeviceSuccess.value = false;
    apiError.value = null;
  }

  _handleLoginSuccess(LoginResponse res) async {
    final accessToken = res.data?.accessToken ?? '';
    await _saveAccessTokenToDevice(accessToken);
    await _getMyInfo();
    await _sendDeviceInfo();
  }

  _saveAccessTokenToDevice(accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsKeys.accessToken.key, accessToken);
  }

  _getMyInfo() async {
    final result = await MemberApi.findMe();

    result.when((e) => apiError.value = e,
        (response) async => await _handleGetMyInfoSuccess(response));
  }

  _handleGetMyInfoSuccess(GetMyInfoResponse res) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPrefsKeys.id.key, res.data.member.id);

    final trainerInfo = res.data.member.trainerInfo;

    isRoleTrainer.value = (trainerInfo != null);
  }

  _sendDeviceInfo() async {
    final deviceInfo = await getDeviceInfo();

    final dto = AddDeviceDto(
        uuid: deviceInfo?.uuid ?? "",
        modelName: deviceInfo?.model ?? "",
        deviceToken: deviceInfo?.token ?? "");

    final result = await MemberDevicesApi.add(dto);

    result.when(
        (e) => apiError.value = e, (res) => addDeviceSuccess.value = res);
  }

  @override
  void onInit() {
    super.onInit();

    ever(isRoleTrainer, (_) {
      _loginSuccess.value = true;
    });
  }

  // TODO: DELETE
  testUserLogin() async {
    final dto =
        RequestLoginDto(email: "test@gmail.com", password: "asdasd123!!");
    final result = await LoginApi.login(dto);

    result.when((e) => apiError.value = e,
        (response) async => await _handleLoginSuccess(response));
  }
  // TODO: DELETE

}
