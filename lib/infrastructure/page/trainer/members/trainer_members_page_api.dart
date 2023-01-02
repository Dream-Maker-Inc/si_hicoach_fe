import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/dto/get_members_page_response.dart';

class TrainerMembersPageApi {
  static Future<Result<Exception, GetMembersPageResponse>> getData(
      {bool isFinished = false}) async {
    return safeApiCall<GetMembersPageResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/app/trainer/members';

      final response = await dio
          .get(path, queryParameters: {'isNotLeftTickets': isFinished});

      return Success(GetMembersPageResponse.fromJson(response.data));
    });
  }
}
