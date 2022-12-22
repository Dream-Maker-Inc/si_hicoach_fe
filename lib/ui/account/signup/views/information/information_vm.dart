import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/common/policies/my_regex.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/signup_vm.dart';
import 'package:si_hicoach_fe/infrastructure/signup/signup_api.dart';

class SignupInformationViewModel extends PasswordFeature {
  final SignupViewModel _signupVm = Get.find<SignupViewModel>();

  // submit button
  bool get buttonDisabled {
    final isValidAll = isValidEmail &&
        !validateEmailButtonDisabled &&
        isValidPassword &&
        isMatchedPassword;

    return !isValidAll;
  }

  submit() {
    _saveToSignupViewModel();
    _signupVm.signup();
  }

  _saveToSignupViewModel() {
    _signupVm.email = email.value;
    _signupVm.password = password.value;
  }
}

// 비밀번호 검증 기능
class PasswordFeature extends EmailFeature {
  // password
  RxString password = RxString('');

  // 비밀번호 형식 일치 여부
  bool get isValidPassword => passwordRegex.hasMatch(password.value);

  String? get passwordErrorText {
    if (password.isEmpty) return null;

    if (!isValidPassword) return "패스워드 형식이 맞지 않습니다.";

    return null;
  }

  // password repeat
  RxString pwRepeat = RxString('');

  // 비밀번호 재입력 일치 여부
  bool get isMatchedPassword => password == pwRepeat;

  String? get pwRepeatErrorText {
    if (pwRepeat.isEmpty) return null;

    if (!isMatchedPassword) return "패스워드가 일치하지 않습니다.";

    return null;
  }
}

// 이메일 검증 기능
class EmailFeature extends GetxController {
  RxString email = RxString('');

  // 이메일 형식 일치 여부
  bool get isValidEmail => emailRegex.hasMatch(email.value);

  // 이미 사용중인 이메일 여부
  bool get _isExistEmail => _isExistEmailRx.value ?? false;
  final RxnBool _isExistEmailRx = RxnBool(null);

  bool get validateEmailButtonDisabled =>
      (_isExistEmailRx.value == true) || (_isExistEmailRx.value == null);

  String? get emailErrorText {
    if (email.isEmpty) return null;

    if (!isValidEmail) return "이메일 형식이 맞지 않습니다.";
    if (_isExistEmail) return "이미 사용중인 이메일 입니다.";

    return null;
  }

  validateEmail(String email) async {
    final result = await SignupApi.validateEmail(email);

    result.when(
      (e) {
        if (e is AlreadyUsedEmailException) {
          _isExistEmailRx.value = true;
        }
      },
      (res) {
        final isExistEmail = !(res.data?.isValid ?? true);
        _isExistEmailRx.value = isExistEmail;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(email, (_) => _resetEmailExistState());
  }

  _resetEmailExistState() {
    _isExistEmailRx.value = null;
  }
}
