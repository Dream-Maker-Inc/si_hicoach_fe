import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:si_hicoach_fe/domain/test/dto/get_members/GetMembersResponse.dart';

class MemberApi {
  static Future<GetMembersResponse> getMembers() async {
    Uri url = Uri.https('randomuser.me', '/api', {'results': '20'});
    http.Response response = await http.get(url);
    String json = utf8.decode(response.bodyBytes);
    Map<String, dynamic> map = jsonDecode(json);
    return GetMembersResponse.fromJson(map);
  }

  static Future<bool> deleteMember(String id) async {
    return true;
  }
}
