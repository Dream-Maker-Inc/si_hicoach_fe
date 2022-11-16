import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/create_matching_dto.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/create_matching_response.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/get_matching_response.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/recover_matching_response.dart';
import 'package:si_hicoach_fe/infrastructure/matching/dto/update_matching_dto.dart';

class MatchingApi {
  static Future<Result<Exception, CreateMatchingResponse>> create(
      CreateMatchingDto dto) async {
    return safeApiCall<CreateMatchingResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching';

      final response = await dio.post(path, data: dto.toMap());

      return Success(CreateMatchingResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, GetMatchingResponse>> findOne(
      int matchingId) async {
    return safeApiCall<GetMatchingResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/matching/$matchingId';

      final response = await dio.get(path);

      return Success(GetMatchingResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, RecoverMatchingResponse>> recover(
      int matchingId) async {
    return safeApiCall<RecoverMatchingResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching/$matchingId/recover';

      final response = await dio.patch(path);

      return Success(RecoverMatchingResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, bool>> update(
      int matchingId, UpdateMatchingDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/trainer/matching/$matchingId';

      await dio.patch(path, data: dto.toMap());

      return const Success(true);
    });
  }
}
