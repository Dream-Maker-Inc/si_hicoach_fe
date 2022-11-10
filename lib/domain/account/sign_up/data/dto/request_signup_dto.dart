import 'package:si_hicoach_fe/domain/account/sign_up/data/models/gender_types.dart';

class RequestSignUpDto {
  SignupMember member;
  List<int> termIds = [];

  RequestSignUpDto({required this.member, required this.termIds});

  Map<String, dynamic> toMap() {
    return {
      'member': member.toMap(),
      'termIds': termIds
    };
  }
}

class SignupMember {
  String email;
  String password;
  String name;
  Gender gender;
  DateTime birthDay;
  String phone;

  SignupTrainerInfo trainerInfo;

  SignupMember(
      {required this.email,
      required this.password,
      required this.name,
      required this.gender,
      required this.birthDay,
      required this.phone,
      required this.trainerInfo});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'gender': gender.name,
      'birthDay': birthDay.toIso8601String(),
      'phone': phone,
      'trainerInfo': trainerInfo.toMap()
    };
  }
}

class SignupTrainerInfo {
  String companyName;

  SignupTrainerInfo({required this.companyName});

  Map<String, dynamic> toMap() {
    return {'companyName': companyName};
  }
}
