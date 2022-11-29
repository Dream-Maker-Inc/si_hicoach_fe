import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/main_page/dto/get_member_main_latest_study_response.dart';

class MemberMainPageApi {
  static Future<Result<Exception, GetMemberMainLatestStudyResponse>>
      getLatestStudy() async {
    return safeApiCall<GetMemberMainLatestStudyResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/app/member/main';

      final res = await dio.get(path, queryParameters: {'type': 'latest'});

      if (res.data?['statusCode'] == StatusCode.notExist.code) {
        return Error(NotExistException());
      }

      return Success(GetMemberMainLatestStudyResponse.fromJson(res.data));
    });
  }
}
