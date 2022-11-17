import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:dio/dio.dart';
import 'package:si_hicoach_fe/infrastructure/signup/dto/request_signup_dto.dart';
import 'package:si_hicoach_fe/infrastructure/signup/dto/signup_response.dart';
import 'package:si_hicoach_fe/infrastructure/signup/dto/validate_email_response.dart';

class SignupApi {
  static Future<Result<Exception, SignUpResponse>> signup(
      RequestSignUpDto dto) async {
    return safeApiCall<SignUpResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/signUp';

      final response = await dio.post(path, data: dto.toMap());

      if (response.data?['statusCode'] ==
          StatusCode.missingRequiredTerms.code) {
        return Error(MissingRequiredTermException());
      }

      return Success(SignUpResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, ValidateEmailResponse>> validateEmail(
      String email) async {
    try {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/email/validate';

      var response = await dio.post(path, data: {"email": email});

      if (response.data?['statusCode'] == StatusCode.alreadyUsedEmail.code) {
        return Error(AlreadyUsedEmailException());
      }

      return Success(ValidateEmailResponse.fromJson(response.data));
    } catch (e) {
      return Error(Exception(e));
    }
  }
}