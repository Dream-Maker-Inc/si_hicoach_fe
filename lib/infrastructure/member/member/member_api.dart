import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/find_id_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/update_my_info_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/update_password_dto.dart';

class MemberApi {
  static Future<Result<Exception, GetMyInfoResponse>> findMe() async {
    return safeApiCall<GetMyInfoResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/me';

      final response = await dio.get(path);

      return Success(GetMyInfoResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, bool>> updateMyInfo(
      UpdateMyInfoDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member';

      await dio.patch(path, data: dto.toMap());

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> updatePassword(
      int memberId, UpdatePasswordDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/$memberId/password';

      await dio.post(path, data: dto.toMap());

      return const Success(true);
    }, handleError: (DioError e) {
      return Error(UnauthorizedException());
    });
  }

  //
  static Future<Result<Exception, FindIdResponse>> findId(
      String certificationToken) async {
    return safeApiCall<FindIdResponse>(() async {
      Dio dio = DioHelper().pureDio;
      String path = '/api/v2/member/email';
      dio.options.headers['Authorization'] = 'Bearer $certificationToken';

      final res = await dio.get(path);

      if (res.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(FindIdResponse.fromJson(res.data));
    });
  }
}
