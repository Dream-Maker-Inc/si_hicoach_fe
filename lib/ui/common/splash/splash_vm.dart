import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';

class SplashViewModel extends GetxController {
  // 디바이스에 저장된 액세스 토큰이 존재하는지
  Future<bool> getIsHaveAccessToken() async {
    return await SharedPrefsManager().isHaveAccessToken();
  }

  // 유저 타입이 트레이너인지
  Future<bool> getIsRoleTrainer() async {
    return SharedPrefsManager().isRoleTrainer();
  }
}
