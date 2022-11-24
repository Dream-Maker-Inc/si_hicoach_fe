import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';
import 'package:si_hicoach_fe/infrastructure/auth/auth_api.dart';
import 'package:si_hicoach_fe/infrastructure/auth/dto/request_certifications_response.dart';
import 'package:si_hicoach_fe/infrastructure/signup/signup_api.dart';

class VerifyViewModel extends _FetchController {
  final SignupViewModel _signupVm = Get.find<SignupViewModel>();

  @override
  void onInit() {
    super.onInit();

    ever(_certifiationsResponse, (_) => validatePhone(phone));
    ever(validatePhoneSuccess, (isSuccess) {
      if (!isSuccess) return;

      _syncSignupViewModel();
    });
  }

  _syncSignupViewModel() {
    _signupVm.name = memberName;
    _signupVm.birthDay = DateTime.parse(birthDay);
    _signupVm.phone = phone;
  }
}

class _FetchController extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch
  final Rxn<RequestCertificationsResponse> _certifiationsResponse = Rxn();
  CertificationInfo? get info =>
      _certifiationsResponse.value?.data.certificationInfo;

  String get memberName => info?.username ?? "";
  String get birthDay => info?.birthDay ?? "";
  String get phone => info?.phone ?? "";

  Future certificate(String uid) async {
    final result = await AuthApi.certificate(uid);

    result.when((e) => (apiError.value = e),
        (response) => (_certifiationsResponse.value = response));
  }

  // validate phone
  final RxBool validatePhoneSuccess = RxBool(false);

  Future validatePhone(String phone) async {
    final result = await SignupApi.validatePhone(phone);

    result.when(
        (e) => (apiError.value = e),
        (response) =>
            (validatePhoneSuccess.value = response.data?.isValid ?? false));
  }
}
