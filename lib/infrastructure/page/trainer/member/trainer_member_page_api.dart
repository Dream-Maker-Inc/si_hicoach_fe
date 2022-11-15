import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/member/dto/get_member_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/dto/get_members_page_response.dart';

class TrainerMemberPageApi {
  static Future<Result<Exception, GetMemberPageResponse>> getData(
      int memberId) async {
    return safeApiCall<GetMemberPageResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/app/trainer/members/$memberId';

      final response = await dio.get(path);

      return Success(GetMemberPageResponse.fromJson(response.data));
    });
  }
}
