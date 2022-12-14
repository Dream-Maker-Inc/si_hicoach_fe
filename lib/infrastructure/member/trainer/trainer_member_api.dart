import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/dto/get_member_of_trainer_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/trainer/dto/get_member_response.dart';

class TrainerMemberApi {
  static Future<Result<Exception, GetMemberResponse>> findOne(int id) async {
    return safeApiCall<GetMemberResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/member/$id';

      final response = await dio.get(path);

      if (response.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(GetMemberResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, GetMemberOfTrainerResponse>>
      getMemberWithMatching(String email) async {
    return safeApiCall<GetMemberOfTrainerResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/member/with-matching';

      final response = await dio.get(path, queryParameters: {'email': email});

      if (response.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(GetMemberOfTrainerResponse.fromJson(response.data));
    });
  }
}
