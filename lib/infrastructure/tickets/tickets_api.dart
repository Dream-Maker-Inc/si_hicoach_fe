import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/tickets/dto/get_tickets_info_response.dart';

class TicketsApi {
  static Future<Result<Exception, GetTicketsInfoResponse>> getTicketsInfo(
      int matchingId) async {
    return safeApiCall<GetTicketsInfoResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching/$matchingId/tickets';

      final response = await dio.get(path);

      return Success(GetTicketsInfoResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, bool>> increase(
      {required int matchingId, required int count}) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching/$matchingId/tickets';

      await dio.post(path, data: {'tickets': count});

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> decrease(
      {required int matchingId, required int count}) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching/$matchingId/tickets';

      await dio.delete(path, data: {'tickets': count});

      return const Success(true);
    });
  }
}
