import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_page/dto/get_member_my_page_response.dart';

class MemberMyPageApi {
  static Future<Result<Exception, GetMemberMyPageResponse>> getData(
      {bool isFinished = false}) async {
    return safeApiCall<GetMemberMyPageResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/app/member/my-page';

      final response = await dio.get(path);

      return Success(GetMemberMyPageResponse.fromJson(response.data));
    });
  }
}
