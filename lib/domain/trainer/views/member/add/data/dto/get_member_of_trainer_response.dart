class GetMemberOfTrainerResponse {
  GetMemberOfTrainerResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  GetMemberOfTrainerResponse.fromJson(Map<String, dynamic> json) {
    ref = null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ref'] = ref;
    _data['data'] = data?.toJson();
    _data['statusCode'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.member,
    required this.matching,
  });

  late final Member member;
  late final Matching? matching;

  Data.fromJson(Map<String, dynamic> json) {
    final matchingJson = json['matching'];

    member = Member.fromJson(json['member']);
    matching = matchingJson != null ? Matching.fromJson(matchingJson) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['member'] = member.toJson();
    _data['matching'] = matching?.toJson();
    return _data;
  }
}

class Member {
  Member({
    required this.id,
    required this.email,
    required this.name,
  });

  late final int id;
  late final String email;
  late final String name;

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    return _data;
  }
}

class Matching {
  Matching({
    required this.id,
  });

  late final int id;

  Matching.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}
