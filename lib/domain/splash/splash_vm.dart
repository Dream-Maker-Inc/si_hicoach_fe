import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/common/utils/device_info/device_info.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/dto/add_device_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/member_devices_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class SplashViewModel extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // true -> main, false -> login, null -> pending
  Rxn<bool> isAutoLogin = Rxn();

  //

  ifAutoLoginThenFlow() async {
    final isHaveAccessToken = await _isHaveAccessToken();

    if (!isHaveAccessToken) {
      isAutoLogin.value = false;
      return;
    }

    Future.wait([_getMyInfo(), _sendDeviceInfo()]);
  }

  _isHaveAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(SharedPrefsKeys.accessToken.key);

    return accessToken != null;
  }

  // get my info
  RxBool isRoleTrainer = RxBool(false);

  Future _getMyInfo() async {
    final result = await MemberApi.findMe();

    result.when((e) => apiError.value = e,
        (response) async => await _handleGetMyInfoSuccess(response));
  }

  Future _handleGetMyInfoSuccess(GetMyInfoResponse res) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPrefsKeys.id.key, res.data.member.id);

    final trainerInfo = res.data.member.trainerInfo;

    isRoleTrainer.value = (trainerInfo != null);
  }

  // add device
  Rx<bool> addDeviceSuccess = Rx(false);

  Future _sendDeviceInfo() async {
    final deviceInfo = await getDeviceInfo();

    final dto = AddDeviceDto(
        uuid: deviceInfo?.uuid ?? "",
        modelName: deviceInfo?.model ?? "",
        deviceToken: deviceInfo?.token ?? "");

    final result = await MemberDevicesApi.add(dto);

    result.when(
        (e) => apiError.value = e, (res) => addDeviceSuccess.value = res);
  }

  //
  @override
  void onInit() {
    super.onInit();

    ever(addDeviceSuccess, (res) => isAutoLogin.value = true);
    ever(apiError, (e) {
      if (e is UnauthorizedException) {
        _deleteAccessToken();
        isAutoLogin.value = false;
      }
    });
  }

  Future _deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefsKeys.accessToken.key);
  }
}
