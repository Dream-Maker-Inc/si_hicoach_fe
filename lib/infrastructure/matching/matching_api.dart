import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/recover_matching_response.dart';

class MatchingApi {
  static Future<Result<Exception, RecoverMatchingResponse>> recover(
      int matchingId) async {
    return safeApiCall<RecoverMatchingResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching/$matchingId/recover';

      final response = await dio.patch(path);

      return Success(RecoverMatchingResponse.fromJson(response.data));
    });
  }
}
