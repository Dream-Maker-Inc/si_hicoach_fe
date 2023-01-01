import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart';

class TicketsApi {
  static Future<Result<Exception, GetMatchingResponse>> getTicketsInfo(
    int matchingId,
  ) async {
    return safeApiCall<GetMatchingResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/matching/$matchingId';

      final response = await dio.get(path);

      return Success(GetMatchingResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, bool>> increase(
      {required int matchingId, required int count}) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/matching/$matchingId/tickets';

      await dio.post(path, data: {'tickets': count});

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> decrease(
      {required int matchingId, required int count}) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/matching/$matchingId/tickets';

      await dio.delete(path, data: {'tickets': count});

      return const Success(true);
    });
  }
}
