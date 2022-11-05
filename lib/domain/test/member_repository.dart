
import 'package:si_hicoach_fe/domain/test/member_api.dart';
import 'package:si_hicoach_fe/domain/test/models/member.dart';

class MemberRepository {
  Future<List<Member>> find() async {
    var response = await MemberApi.getMembers();

    if (response.results == null) {
      throw Exception('API 응답이 존재하지 않습니다.');
    }

    List<Member> members = response.toDomain();

    return members;
  }

  Future<bool> delete(String id) async {
    return await MemberApi.deleteMember(id);
  }
}
