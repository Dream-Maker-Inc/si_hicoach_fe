import 'package:dio/dio.dart';

BaseOptions options =
    BaseOptions(baseUrl: 'http://f756-218-236-78-53.ngrok.io');

class DioHelper {
  DioHelper._privateConstructor();
  static final DioHelper _instance = DioHelper._privateConstructor();
  factory DioHelper() => _instance;

  Dio dio = Dio(options);
}
