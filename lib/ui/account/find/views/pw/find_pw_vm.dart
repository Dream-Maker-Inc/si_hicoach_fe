import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/policies/my_regex.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';
import 'package:si_hicoach_fe/infrastructure/signup/signup_api.dart';

class FindPasswordViewModel extends PasswordFeature {
  bool get submitButtonDisabled => !isValidPw || !isMatchedPassword;

  // update
  final RxBool updatePwSuccess = RxBool(false);

  submit(String certificationToken) async {
    final result = await MemberApi.resetPassword(
      certificationToken,
      pw.value,
    );

    result.when(
      (e) => (apiError.value = e),
      (res) => (updatePwSuccess.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) {
      apiError.value = null;
    });

    ever(validateEmailSuccess, (_) {
      validateEmailSuccess.value = false;
    });
  }
}

class PasswordFeature extends EmailValidationFeature {
  // reset password page
  final RxString pw = RxString('');
  bool get isValidPw => passwordRegex.hasMatch(pw.value);

  String? get passwordErrorText {
    if (pw.isEmpty) return null;

    if (!isValidPw) return "패스워드 형식이 맞지 않습니다.";

    return null;
  }

  RxString pwRepeat = RxString('');
  bool get isMatchedPassword => pw == pwRepeat;

  String? get pwRepeatErrorText {
    if (pwRepeat.isEmpty) return null;

    if (!isMatchedPassword) return "패스워드가 일치하지 않습니다.";

    return null;
  }
}

class EmailValidationFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final RxString email = RxString('');
  bool get nextButtonDisabled => email.value.isEmpty;

  final RxBool validateEmailSuccess = RxBool(false);

  validateEmail(String email) async {
    final result = await SignupApi.validateEmail(email);

    result.when(
      (e) => (apiError.value = e),
      (res) {
        final isValidEmail = res.data?.isValid ?? false;
        validateEmailSuccess.value = isValidEmail;
      },
    );
  }
}
