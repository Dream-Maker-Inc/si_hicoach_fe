import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/dio/http_utils.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:dio/dio.dart';
import 'package:si_hicoach_fe/infrastructure/signup/dto/request_signup_dto.dart';
import 'package:si_hicoach_fe/infrastructure/signup/dto/validate_response.dart';

class SignupApi {
  static Future<Result<Exception, bool>> signup(RequestSignUpDto dto) async {
    return safeApiCall<bool>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/member/signUp';

      final response = await dio.post(path, data: dto.toMap());

      if (response.data?['statusCode'] ==
          StatusCode.missingRequiredTerms.code) {
        return Error(MissingRequiredTermException());
      }

      if (response.data?['statusCode'] == StatusCode.alreadyUsedEmail.code) {
        return Error(AlreadyUsedEmailException());
      }

      if (response.data?['statusCode'] == StatusCode.alreadyUsedPhone.code) {
        return Error(AlreadyUsedPhoneException());
      }

      return const Success(true);
    });
  }

  static Future<Result<Exception, ValidateResponse>> validateEmail(
      String email) async {
    return safeApiCall<ValidateResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/member/email/validate';

      var response = await dio.post(path, data: {"email": email});

      if (response.data?['statusCode'] == StatusCode.alreadyUsedEmail.code) {
        return Error(AlreadyUsedEmailException());
      }

      return Success(ValidateResponse.fromJson(response.data));
    });
  }

  static Future<Result<Exception, ValidateResponse>> validatePhone(
      String phone) async {
    return safeApiCall<ValidateResponse>(() async {
      Dio dio = DioHelper().dio;
      String path = '/api/v4/member/phone/validate';

      var response = await dio.post(path, data: {"phone": phone});

      if (response.data?['statusCode'] == StatusCode.alreadyUsedPhone.code) {
        return Error(AlreadyUsedPhoneException());
      }

      return Success(ValidateResponse.fromJson(response.data));
    });
  }
}
