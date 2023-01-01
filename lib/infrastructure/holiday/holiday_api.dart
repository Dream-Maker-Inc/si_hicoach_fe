import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/holiday/dto/get_holiday_response.dart';

class HolidayApi {
  static Future<Result<Exception, GetHolidayResponse>> getHolidays(
      String yearMonth) async {
    return safeApiCall<GetHolidayResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/holidays';

      final response =
          await dio.get(path, queryParameters: {'yearMonth': yearMonth});

      return Success(GetHolidayResponse.fromJson(response.data));
    });
  }
}
