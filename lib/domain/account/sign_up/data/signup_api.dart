import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:si_hicoach_fe/domain/account/sign_up/data/dto/SignupResponse.dart';

class SignupApi {
  // 스테틱 메소드는 클래스를 생성하지 않고 불러 쓸 수 있음
  static Future<SignupResponse> signup() async {

    try {
      var url = Uri.https(
          '8210-218-236-78-53.ngrok.io', '/api/v2/member/signUp');
      var response = await http.get(url);

      switch (response.statusCode) {
        case HttpStatus.ok:
          var json = utf8.decode(response.bodyBytes);
          Map<String, dynamic> map = jsonDecode(json);
          return SignupResponse.fromJson(map);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      // make it explicit that a SocketException will be thrown if the network connection fails
      rethrow;
    }
  }
}
