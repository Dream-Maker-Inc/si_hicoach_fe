import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/domain/account/login/data/dto/login_response.dart';
import 'package:si_hicoach_fe/domain/account/login/data/dto/request_login_dto.dart';
import 'package:dio/dio.dart';

class LoginApi {
  static Future<Result<Exception, LoginResponse>> login(
      RequestLoginDto dto) async {
    return safeApiCall<LoginResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/auth/login';

      final response = await dio.post(path, data: dto.toMap());

      if (response.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(LoginResponse.fromJson(response.data));
    });
  }
}
