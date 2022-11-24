import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/main/dto/get_trainer_main_response.dart';

class TrainerMainPageApi {
  static Future<Result<Exception, GetTrainerMainResponse>> getData(
      String date) async {
    return safeApiCall<GetTrainerMainResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/app/trainer/main';

      final response = await dio.get(path, queryParameters: {'date': date});

      return Success(GetTrainerMainResponse.fromJson(response.data));
    });
  }
}
