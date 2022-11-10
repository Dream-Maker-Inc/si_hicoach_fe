import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/exceptions/status_code.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/dto/request_signup_dto.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/dto/signup_response.dart';
import 'package:dio/dio.dart';

class SignupApi {
  static Future<Result<Exception, SignupResponse>> signup(
      RequestSignUpDto dto) async {
    try {
      Dio dio = DioHelper().dio;
      String path = '/api/v2/member/signUp';

      var response = await dio.post(path, data: dto.toMap());

      if (response.data?['statusCode'] ==
          StatusCode.missingRequiredTerms.code) {
        return Error(MissingRequiredTermException());
      }

      return Success(SignupResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Error(Exception(e));
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
