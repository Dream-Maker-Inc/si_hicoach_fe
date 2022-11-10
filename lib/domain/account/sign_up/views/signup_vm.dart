import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/dto/request_signup_dto.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/models/gender_types.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/signup_api.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/data/models/member_types.dart';

class SignupViewModel extends GetxController {
  // data
  List<int> agreedTermIds = [];
  MemberTypes memberType = MemberTypes.normal;
  String companyName = '';
  String email = '';
  String password = '';
  String name = 'test';
  DateTime birthDay = DateTime.now();
  String phone = '010-0000-0003';
  Gender gender = Gender.male;

  _createDto() {
    final trainerInfo = companyName.isNotEmpty
        ? SignupTrainerInfo(companyName: companyName)
        : null;

    final member = SignupMember(
        email: email,
        password: password,
        name: name,
        gender: gender,
        birthDay: birthDay,
        phone: phone,
        trainerInfo: trainerInfo);

    final RequestSignUpDto dto =
        RequestSignUpDto(member: member, termIds: agreedTermIds);

    return dto;
  }

  // signup
  Rx<bool> signupSuccess = Rx(false);
  Rx<Exception?> signupError = Rx(null);

  Future<void> signup() async {
    final dto = _createDto();
    final result = await SignupApi.signup(dto);

    result.when((e) => signupError.value = e,
        (response) => signupSuccess.value = true);
  }
}
