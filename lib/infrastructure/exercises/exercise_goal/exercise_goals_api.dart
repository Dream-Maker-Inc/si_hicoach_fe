import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_goal/dto/get_exercise_goal_response.dart';

class ExerciseGoalsApi {
  static Future<Result<Exception, GetExerciseGoalResponse>> findAll() async {
    return safeApiCall<GetExerciseGoalResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/exercise-goal';

      final response = await dio.get(path);

      return Success(GetExerciseGoalResponse.fromJson(response.data));
    });
  }
}
