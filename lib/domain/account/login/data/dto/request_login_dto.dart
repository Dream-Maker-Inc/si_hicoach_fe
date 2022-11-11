class RequestLoginDto {
  String email = '';
  String password = '';

  RequestLoginDto({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
