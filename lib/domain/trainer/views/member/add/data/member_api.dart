import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:dio/dio.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/data/dto/get_member_of_trainer_response.dart';

class TrainerMemberApi {
  static Future<Result<Exception, GetMemberOfTrainerResponse>>
      getMemberOfTrainer(String email) async {
    return safeApiCall<GetMemberOfTrainerResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/with-matching';

      final response = await dio.get(path, queryParameters: {'email': email});

      if (response.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(GetMemberOfTrainerResponse.fromJson(response.data));
    });
  }
}
