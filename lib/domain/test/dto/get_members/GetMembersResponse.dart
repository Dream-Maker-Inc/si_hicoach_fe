
import 'package:si_hicoach_fe/domain/test/models/member.dart';

import 'Results.dart';

/// results : [{"gender":"female","name":{"title":"Ms","first":"Holly","last":"Bell"},"location":{"street":{"number":7449,"name":"Cork Street"},"city":"Athy","state":"Fingal","country":"Ireland","postcode":15562,"coordinates":{"latitude":"-1.8386","longitude":"150.8498"},"timezone":{"offset":"-9:00","description":"Alaska"}},"email":"holly.bell@example.com","login":{"uuid":"60d1b104-08d1-4a27-a313-d0765ffb79e6","username":"brownswan123","password":"antares","salt":"G2hOlDMn","md5":"156427903080b6dfb734ddc0f200b0b6","sha1":"aa91b97bfcc06e81bcb4f6da9ee8ef27da74f611","sha256":"8f8ad6f00f459775be04dd292b4ec943b3d2511eef17f564d1f15893383f7814"},"dob":{"date":"1971-12-22T16:30:57.609Z","age":50},"registered":{"date":"2009-10-13T17:36:13.246Z","age":13},"phone":"071-974-5931","cell":"081-581-5424","id":{"name":"PPS","value":"6975372T"},"picture":{"large":"https://randomuser.me/api/portraits/women/36.jpg","medium":"https://randomuser.me/api/portraits/med/women/36.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/36.jpg"},"nat":"IE"}]

class GetMembersResponse {
  GetMembersResponse({
    List<Results>? results,
  }) {
    _results = results;
  }

  GetMembersResponse.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }

  List<Results>? _results;

  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  List<Member> toDomain() {
    List<Member> members = results?.map((it) {
          var id = it.id;
          var name = it.name;
          var gender = it.gender ?? 'male';

          var memberId = (id?.name ?? '') + (id?.value ?? '');
          var memberName =
              (name?.title ?? '') + (name?.first ?? '') + (name?.last ?? '');

          return Member(memberId, memberName, gender);
        }).toList() ??
        [];

    return members;
  }
}
