import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/infrastructure/terms/dto/get_terms_response.dart';

class TermsApi {
  static Future<Result<Exception, GetTermsResponse>> getTerms() async {
    return safeApiCall<GetTermsResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/terms';

      final response = await dio.get(path);

      return Success(GetTermsResponse.fromJson(response.data));
    });
  }
}
