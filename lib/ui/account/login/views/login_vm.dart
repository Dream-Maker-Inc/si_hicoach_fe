import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/common/utils/device_info/device_info.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/login_response.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/request_login_dto.dart';
import 'package:si_hicoach_fe/infrastructure/login/login_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/dto/add_device_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/devices/member_devices_api.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class LoginViewModel extends LoginFeature {
  clear() {
    _isRoleTrainer.value = false;
    _loginSuccess.value = false;
    addDeviceSuccess.value = false;
    apiError.value = null;
  }

  @override
  onInit() {
    super.onInit();

    ever(apiError, (e) => clear());
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

// 로그인 기능
class LoginFeature extends MyInfoFetchFeature {
  final Rx<bool> _loginSuccess = Rx(false);

  submit() async {
    final dto = RequestLoginDto(email: email.value, password: password.value);

    final result = await LoginApi.login(dto);

    result.when(
      (e) => apiError.value = e,
      (response) => _handleLoginSuccess(response),
    );
  }

  _handleLoginSuccess(LoginResponse res) async {
    final accessToken = res.data?.accessToken ?? '';

    Future.wait([
      saveAccessTokenToDevice(accessToken),
      _fetchMyInfo(),
      _sendDeviceInfo()
    ]);
  }
}

// 로그인한 유저 정보 불러오기 기능
class MyInfoFetchFeature extends DeviceInfoAddFeature {
  final RxBool _isRoleTrainer = RxBool(false);
  bool get isRoleTrainer => _isRoleTrainer.value;

  Future _fetchMyInfo() async {
    final result = await MemberApi.findMe();

    result.when((e) => apiError.value = e,
        (response) async => await _handleGetMyInfoSuccess(response));
  }

  Future _handleGetMyInfoSuccess(GetMyInfoResponse res) async {
    final userId = res.data.member.id;
    final trainerInfo = res.data.member.trainerInfo;
    final isRoleTrainer = (trainerInfo != null);

    await saveUserId(userId);

    _isRoleTrainer.value = isRoleTrainer;
  }
}

// 디바이스 정보 추가하기 기능
class DeviceInfoAddFeature extends LocalDataSaveFeature {
  Rx<bool> addDeviceSuccess = Rx(false);

  // 로그인한 디바이스 정보 서버로 전달
  Future _sendDeviceInfo() async {
    final deviceInfo = await getDeviceInfo();
    final uuid = deviceInfo?.uuid ?? "";
    final model = deviceInfo?.model ?? "";
    final token = deviceInfo?.token ?? "";

    final dto = AddDeviceDto(uuid: uuid, modelName: model, deviceToken: token);

    final result = await MemberDevicesApi.add(dto);

    result.when(
        (e) => apiError.value = e, (res) => addDeviceSuccess.value = res);
  }
}

// 액세스 토큰 저장 기능
class LocalDataSaveFeature extends BaseLoginViewModel {
  Future saveUserId(int userId) async {
    SharedPrefsManager().setUserId(userId);
  }

  Future saveAccessTokenToDevice(String accessToken) async {
    SharedPrefsManager().setAccessToken(accessToken);
  }
}

// UI 관련 기능 뷰모델
class BaseLoginViewModel extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  RxString email = RxString('admin@gmail.com');
  RxString password = RxString('asdasd123!!');

  bool get buttonDisabled => email.isEmpty || password.isEmpty;
}
