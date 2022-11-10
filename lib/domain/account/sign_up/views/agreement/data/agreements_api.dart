import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/data/dto/get_terms_response.dart';

class TermsApi {
  static Future<Result<Exception, GetTermsResponse>> getAgreements() async {
    try {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/terms';

      var response = await dio.get(path);

      return Success(GetTermsResponse.fromJson(response.data));
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
