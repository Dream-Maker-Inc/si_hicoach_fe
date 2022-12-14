import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';

// String url = 'http://192.168.45.231:3000';
String url = 'http://hicoch-alb-1137226405.ap-northeast-2.elb.amazonaws.com';

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

  get pureDio => Dio(_options);
}
