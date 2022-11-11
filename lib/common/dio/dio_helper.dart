import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';

// String url = 'http://27b1-218-236-78-53.ngrok.io';
String url = 'https://hicoch.ureca.im';

BaseOptions _options = BaseOptions(baseUrl: url);
Interceptor _interceptor =
    InterceptorsWrapper(onRequest: (options, handler) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.get(SharedPrefsKeys.accessToken.key) ?? '';

  options.headers['Authorization'] = 'Bearer $accessToken';
  return handler.next(options);
});

_createDio() {
  Dio dio = Dio(_options);
  dio.interceptors.add(_interceptor);

  return dio;
}

class DioHelper {
  DioHelper._privateConstructor();

  static final DioHelper _instance = DioHelper._privateConstructor();

  factory DioHelper() => _instance;

  Dio dio = _createDio();
}
