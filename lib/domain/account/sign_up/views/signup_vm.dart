import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/dto/request_signup_dto.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/models/gender_types.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/signup_api.dart';

class SignupViewModel extends GetxController {
  Rx<Exception?> signupError = Rx(null);

  Future<void> signup() async {
    print("request-> vm -> ");

    SignupMember member = SignupMember(
        email: 'admin@gmail.com',
        password: 'asdasd123!!',
        name: 'admin',
        gender: Gender.male,
        birthDay: DateTime(2022, 1, 1),
        phone: '010-0000-0000',
        trainerInfo: SignupTrainerInfo(companyName: 'ureca'));
    RequestSignUpDto dto = RequestSignUpDto(member: member, termIds: []);

    //
    final result = await SignupApi.signup(dto);

    result.when(
      (e) => signupError.value = e,
      (response) => print(response), // TODO: Do something with location
    );
  }
}
