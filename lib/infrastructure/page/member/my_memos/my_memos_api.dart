import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_memos/dto/get_my_memos_response.dart';

class MyMemosPageApi {
  static Future<Result<Exception, GetMyMemosResponse>> getData(
      {bool isFinished = false}) async {
    return safeApiCall<GetMyMemosResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/app/member/my-memos';

      final response = await dio.get(path, queryParameters: {'size': 9999});

      return Success(GetMyMemosResponse.fromJson(response.data));
    });
  }
}
