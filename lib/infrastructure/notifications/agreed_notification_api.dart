import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/domain/notification/notification_types.dart';
import 'package:si_hicoach_fe/infrastructure/notifications/dto/get_agreed_notifi_list_response.dart';

class AgreedNotificationApi {
  static Future<Result<Exception, bool>> create(PushNotifiTypes type) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/agreed-push-noti';

      await dio.post(path, data: {'type': type.key});

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> delete(int agreedNotifiId) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/agreed-push-noti/$agreedNotifiId';

      await dio.delete(path);

      return const Success(true);
    });
  }

  static Future<Result<Exception, GetAgreedNotifiListResponse>>
      getAgreedNotifiList() async {
    return safeApiCall<GetAgreedNotifiListResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/agreed-push-noti';

      final res = await dio.get(path);

      return Success(GetAgreedNotifiListResponse.fromJson(res.data));
    });
  }
}
