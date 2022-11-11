class LoginResponse {
  LoginResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });
  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  LoginResponse.fromJson(Map<String, dynamic> json){
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
    required this.accessToken,
  });
  late final String accessToken;

  Data.fromJson(Map<String, dynamic> json){
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accessToken'] = accessToken;
    return _data;
  }
}