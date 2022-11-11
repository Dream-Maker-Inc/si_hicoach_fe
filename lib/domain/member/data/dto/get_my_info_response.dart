class GetMyInfoResponse {
  GetMyInfoResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  GetMyInfoResponse.fromJson(Map<String, dynamic> json) {
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
    required this.trainer,
  });

  late final Member member;
  Matching? matching;
  Trainer? trainer;

  Data.fromJson(Map<String, dynamic> json) {
    member = Member.fromJson(json['member']);
    matching = matching != null ? Matching.fromJson(json['matching']) : null;
    trainer = trainer != null ? Trainer.fromJson(json['trainer']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['member'] = member.toJson();
    _data['matching'] = matching?.toJson();
    _data['trainer'] = trainer?.toJson();
    return _data;
  }
}

class Member {
  Member({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.phone,
    this.trainerInfo,
  });

  late final String createdAt;
  late final String updatedAt;
  String? deletedAt;
  late final int id;
  late final String email;
  late final String name;
  late final String gender;
  late final String birthDay;
  late final String phone;
  TrainerInfo? trainerInfo;

  Member.fromJson(Map<String, dynamic> json) {
    final trainerInfoJson = json['trainerInfo'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = null;
    id = json['id'];
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    birthDay = json['birthDay'];
    phone = json['phone'];
    trainerInfo =
        trainerInfoJson != null ? TrainerInfo.fromJson(trainerInfoJson) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['deletedAt'] = deletedAt;
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['birthDay'] = birthDay;
    _data['phone'] = phone;
    _data['trainerInfo'] = trainerInfo?.toJson();
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

class Trainer {
  Trainer({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.phone,
    required this.trainerInfo,
  });

  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final int id;
  late final String email;
  late final String name;
  late final String gender;
  late final String birthDay;
  late final String phone;
  late final TrainerInfo trainerInfo;

  Trainer.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = null;
    id = json['id'];
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    birthDay = json['birthDay'];
    phone = json['phone'];
    trainerInfo = TrainerInfo.fromJson(json['trainerInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['deletedAt'] = deletedAt;
    _data['id'] = id;
    _data['email'] = email;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['birthDay'] = birthDay;
    _data['phone'] = phone;
    _data['trainerInfo'] = trainerInfo.toJson();
    return _data;
  }
}

class TrainerInfo {
  TrainerInfo({
    required this.companyName,
  });

  late final String companyName;

  TrainerInfo.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['companyName'] = companyName;
    return _data;
  }
}
