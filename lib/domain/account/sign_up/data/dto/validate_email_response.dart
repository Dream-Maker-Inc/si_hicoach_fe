class ValidateEmailResponse {
  ValidateEmailResponse({
    this.ref,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  late final dynamic ref;
  late final Data? data;
  late final String statusCode;
  late final String message;

  ValidateEmailResponse.fromJson(Map<String, dynamic> json) {
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
    required this.isValid,
  });

  late final bool isValid;

  Data.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isValid'] = isValid;
    return _data;
  }
}
