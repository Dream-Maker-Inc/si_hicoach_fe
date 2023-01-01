import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/get_inbodies_response.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/update_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/create_today_inBody_dto.dart';

class InBodyApi {
  // inbody
  static Future<Result<Exception, bool>> createTodayInBody(
      CreateTodayInBodyDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v4/inbody/today';

      final res = await dio.post(path, data: dto.toFormData());

      if (res.data?['statusCode'] == StatusCode.alreadyInBody.code) {
        return Error(AlreadyInBodyException());
      }

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> updateInBody(
      int id, UpdateInBodyDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v4/inbody/$id';

      await dio.put(path, data: dto.toFormData());

      return const Success(true);
    });
  }

  static Future<Result<Exception, bool>> deleteInBody(
    int id,
  ) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v4/inbody/$id';

      await dio.delete(path);

      return const Success(true);
    });
  }

  static Future<Result<Exception, GetInbodiesResponse>> getInBodies(
      int memberId) async {
    return safeApiCall<GetInbodiesResponse>(() async {
      Dio dio = DioHelper().dio;

      String path = '/api/v4/inbody';

      final response = await dio
          .get(path, queryParameters: {'size': 9999, 'memberId': memberId});

      return Success(GetInbodiesResponse.fromJson(response.data));
    });
  }
}
