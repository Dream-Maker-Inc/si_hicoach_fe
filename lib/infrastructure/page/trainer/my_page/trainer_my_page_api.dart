import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/my_page/dto/get_my_page_response.dart';

class TrainerMyPageApi {
  static Future<Result<Exception, GetMyPageResponse>> getData(
      {bool isFinished = false}) async {
    return safeApiCall<GetMyPageResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/app/trainer/my-page';

      final response = await dio.get(path);

      return Success(GetMyPageResponse.fromJson(response.data));
    });
  }
}
