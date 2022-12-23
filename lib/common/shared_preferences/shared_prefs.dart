import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';

class SharedPrefsManager {
  SharedPrefsManager._privateConstructor();

  static final SharedPrefsManager _instance =
      SharedPrefsManager._privateConstructor();

  factory SharedPrefsManager() => _instance;

  Future<SharedPreferences> _getSharedPrefsInstance() {
    return SharedPreferences.getInstance();
  }

  //
  Future<bool> setAccessToken(String token) async {
    final sp = await _getSharedPrefsInstance();
    return await sp.setString(SharedPrefsKeys.accessToken.key, token);
  }

  Future<String> getAccessToken() async {
    final sp = await _getSharedPrefsInstance();
    return sp.getString(SharedPrefsKeys.accessToken.key) ?? "";
  }

  Future<bool> setUserId(int id) async {
    final sp = await _getSharedPrefsInstance();
    return await sp.setInt(SharedPrefsKeys.id.key, id);
  }

  Future<int> getUserId() async {
    final sp = await _getSharedPrefsInstance();
    return sp.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}