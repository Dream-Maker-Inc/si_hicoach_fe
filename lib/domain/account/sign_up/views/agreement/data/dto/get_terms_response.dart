class GetTermsResponse {
  GetTermsResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  late final dynamic ref;
  late final List<Data>? data;
  late final String statusCode;
  late final String message;

  GetTermsResponse.fromJson(Map<String, dynamic> json) {
    ref = null;
    data = json['data'] != null
        ? List.from(json['data']).map((e) => Data.fromJson(e)).toList()
        : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ref'] = ref;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['statusCode'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.id,
    required this.title,
    required this.content,
    required this.isRequired,
    this.myAgreed,
  });

  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final int id;
  late final String title;
  late final String content;
  late final bool isRequired;
  late final Null myAgreed;

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = null;
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isRequired = json['isRequired'];
    myAgreed = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['deletedAt'] = deletedAt;
    _data['id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['isRequired'] = isRequired;
    _data['myAgreed'] = myAgreed;
    return _data;
  }
}
