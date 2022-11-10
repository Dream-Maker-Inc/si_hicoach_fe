import 'package:dio/dio.dart';

BaseOptions options =
    BaseOptions(baseUrl: 'https://hicoch.ureca.im');

class DioHelper {
  DioHelper._privateConstructor();
  static final DioHelper _instance = DioHelper._privateConstructor();
  factory DioHelper() => _instance;

  Dio dio = Dio(options);
}
