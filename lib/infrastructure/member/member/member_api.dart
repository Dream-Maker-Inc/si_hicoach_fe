import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';

class MemberApi {
  static Future<Result<Exception, GetMyInfoResponse>> findMe() async {
    return safeApiCall<GetMyInfoResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/me';

      final response = await dio.get(path);

      return Success(GetMyInfoResponse.fromJson(response.data));
    });
  }
}
