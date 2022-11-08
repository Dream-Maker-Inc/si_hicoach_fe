import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/dto/SignupResponse.dart';

class SignupApi {
  // 스테틱 메소드는 클래스를 생성하지 않고 불러 쓸 수 있음
  static Future<Result<Exception, SignupResponse>> signup() async {

    try {
      var url = Uri.https(
          '1c44-125-242-48-109.jp.ngrok.io', '/api/v2/member/signUp');
      var response = await http.get(url);

      switch (response.statusCode) {
        case HttpStatus.ok:
          var json = utf8.decode(response.bodyBytes);
          Map<String, dynamic> map = jsonDecode(json);
          return Success(SignupResponse.fromJson(map));
        default:
          return Error(Exception(response.reasonPhrase));
      }
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
