import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/my_studies/dto/get_member_my_studies_response.dart';

class MyMemberStudiesApi {
  static Future<Result<Exception, GetMemberMyStudiesResponse>> getData() async {
    return safeApiCall<GetMemberMyStudiesResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/app/member/my-studies';

      final response = await dio.get(path);

      return Success(GetMemberMyStudiesResponse.fromJson(response.data));
    });
  }
}
