import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/calendar/dto/get_monthly_calendar_response.dart';

class MemberCalendarApi {
  static Future<Result<Exception, GetMonthlyCalendarResponse>> getMonthlyData(
      String yearMonth) async {
    return safeApiCall<GetMonthlyCalendarResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/app/member/calendar/monthly';

      final res =
          await dio.get(path, queryParameters: {'yearMonth': yearMonth});

      return Success(GetMonthlyCalendarResponse.fromJson(res.data));
    });
  }
}
