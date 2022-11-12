import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/login_response.dart';
import 'package:si_hicoach_fe/infrastructure/login/dto/request_login_dto.dart';
import 'package:dio/dio.dart';
import 'package:si_hicoach_fe/domain/member/data/dto/get_my_info_response.dart';

class MemberApi {
  static Future<Result<Exception, GetMyInfoResponse>> getMyInfo() async {
    return safeApiCall<GetMyInfoResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/me';

      print("# my info");

      final response = await dio.get(path);

      print(response);

      return Success(GetMyInfoResponse.fromJson(response.data));
    });
  }
}
