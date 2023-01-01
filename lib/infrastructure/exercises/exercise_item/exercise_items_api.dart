import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';

class ExerciseItemsApi {
  static Future<Result<Exception, GetExerciseItemsResponse>> search(
      String title) async {
    return safeApiCall<GetExerciseItemsResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/exercise';

      final response =
          await dio.get(path, queryParameters: {'size': 9999, 'title': title});

      return Success(GetExerciseItemsResponse.fromJson(response.data));
    });
  }
}
