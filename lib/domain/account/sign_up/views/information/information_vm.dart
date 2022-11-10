import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/policies/my_regex.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/data/signup_api.dart';

class SignupInformationViewModel extends GetxController {

  // email
  RxString email = RxString('');
  bool get isValidEmail => emailRegex.hasMatch(email.value);
  bool get _isDuplicatedEmail => _isDuplicatedEmailRx.value ?? false;
  final RxnBool _isDuplicatedEmailRx = RxnBool(null);

  bool get validateEmailButtonDisabled =>
      (_isDuplicatedEmailRx.value == true) || (_isDuplicatedEmailRx.value == null);

  String? get emailErrorText {
    if (email.isEmpty) return null;

    if (!isValidEmail) return "이메일 형식이 맞지 않습니다.";

    if (_isDuplicatedEmail) return "이미 사용중인 이메일 입니다.";

    return null;
  }

  validateEmail(String email) async {
    final result = await SignupApi.validateEmail(email);

    result.when(
          (e) {
        if (e is AlreadyUsedEmailException) _isDuplicatedEmailRx.value = true;
      },
          (res) => _isDuplicatedEmailRx.value = !(res.data?.isValid ?? true),
    );
  }

  // password
  RxString password = RxString('');
  bool get isValidPassword => passwordRegex.hasMatch(password.value);

  String? get passwordErrorText {
    if (password.isEmpty) return null;

    if (!isValidPassword) return "패스워드 형식이 맞지 않습니다.";

    return null;
  }

  // password repeat
  RxString pwRepeat = RxString('');
  bool get isMatchedPassword => password == pwRepeat;

  String? get pwRepeatErrorText {
    if (pwRepeat.isEmpty) return null;

    if (!isMatchedPassword) return "패스워드가 일치하지 않습니다.";

    return null;
  }

  // submit button
  bool get buttonDisabled {
    final isValidAll = isValidEmail &&
        !validateEmailButtonDisabled &&
        isValidPassword &&
        isMatchedPassword;

    return !isValidAll;
  }

  @override
  void onInit() {
    super.onInit();

    ever(email, _handleEmailChange);
  }

  _handleEmailChange(String email) {
    _isDuplicatedEmailRx.value = null;
  }
}
