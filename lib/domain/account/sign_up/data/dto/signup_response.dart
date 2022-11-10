class SignupResponse {
  SignupResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });
  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  SignupResponse.fromJson(Map<String, dynamic> json){
    ref = null;
    data = json['data'] != null ? Data.fromJson(json['data']): null;
    statusCode = json['statusCode'].toString();
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
    required this.agreedTerms,
  });
  late final Member member;
  late final List<AgreedTerms> agreedTerms;

  Data.fromJson(Map<String, dynamic> json){
    member = Member.fromJson(json['member']);
    agreedTerms = List.from(json['agreedTerms']).map((e)=>AgreedTerms.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['member'] = member.toJson();
    _data['agreedTerms'] = agreedTerms.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Member {
  Member({
    required this.email,
    required this.name,
    required this.gender,
    required this.birthDay,
    required this.phone,
    required this.password,
    this.deletedAt,
    required this.trainerInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });
  late final String email;
  late final String name;
  late final String gender;
  late final String birthDay;
  late final String phone;
  late final Password password;
  late final Null deletedAt;
  late final TrainerInfo trainerInfo;
  late final String createdAt;
  late final String updatedAt;
  late final int id;

  Member.fromJson(Map<String, dynamic> json){
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    birthDay = json['birthDay'];
    phone = json['phone'];
    password = Password.fromJson(json['password']);
    deletedAt = null;
    trainerInfo = TrainerInfo.fromJson(json['trainerInfo']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['birthDay'] = birthDay;
    _data['phone'] = phone;
    _data['password'] = password.toJson();
    _data['deletedAt'] = deletedAt;
    _data['trainerInfo'] = trainerInfo.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['id'] = id;
    return _data;
  }
}

class Password {
  Password({
    required this.value,
  });
  late final String value;

  Password.fromJson(Map<String, dynamic> json){
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    return _data;
  }
}

class TrainerInfo {
  TrainerInfo({
    this.companyName,
  });
  late final Null companyName;

  TrainerInfo.fromJson(Map<String, dynamic> json){
    companyName = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['companyName'] = companyName;
    return _data;
  }
}

class AgreedTerms {
  AgreedTerms({
    required this.memberId,
    required this.serviceTermId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });
  late final int memberId;
  late final int serviceTermId;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  late final int id;

  AgreedTerms.fromJson(Map<String, dynamic> json){
    memberId = json['memberId'];
    serviceTermId = json['serviceTermId'];
    deletedAt = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['memberId'] = memberId;
    _data['serviceTermId'] = serviceTermId;
    _data['deletedAt'] = deletedAt;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['id'] = id;
    return _data;
  }
}