import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/dto/get_calendar_data_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/dto/get_monthly_calendar_response.dart';

class TrainerCalendarApi {
  static Future<Result<Exception, GetCalendarDataResponse>> getData(
      String yearMonth) async {
    return safeApiCall<GetCalendarDataResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/app/trainer/calendar';

      final res = await dio
          .get(path, queryParameters: {'size': 9999, 'yearMonth': yearMonth});

      return Success(GetCalendarDataResponse.fromJson(res.data));
    });
  }

  static Future<Result<Exception, GetMonthlyCalendarResponse>> getMonthlyData(
      String yearMonth) async {
    return safeApiCall<GetMonthlyCalendarResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/app/trainer/calendar/monthly';

      final res =
          await dio.get(path, queryParameters: {'yearMonth': yearMonth});

      return Success(GetMonthlyCalendarResponse.fromJson(res.data));
    });
  }
}
