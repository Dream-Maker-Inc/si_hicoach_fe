import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/auth/dto/request_certifications_response.dart';

class AuthApi {
  static Future<Result<Exception, RequestCertificationsResponse>> certificate(
      String uid) async {
    return safeApiCall<RequestCertificationsResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/auth/certifications';

      final response = await dio.post(path, data: {'uid': uid});

      return Success(RequestCertificationsResponse.fromJson(response.data));
    });
  }
}
