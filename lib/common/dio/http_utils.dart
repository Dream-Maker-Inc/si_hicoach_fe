import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

Future<Result<Exception, T>> safeApiCall<T>(
    Future<Result<Exception, T>> Function() request) async {
  try {
    return await request();
  } on DioError catch (e) {
    print("##############################");
    print(e.message);
    print(e.response?.data);
    print("##############################");
    return Error(Exception(e));
  } catch (e) {
    return Error(Exception(e));
  }
}
