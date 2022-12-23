import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/auth/auth_api.dart';
import 'package:si_hicoach_fe/infrastructure/auth/dto/request_certifications_response.dart';

class CertificationViewModel extends _CertificationFeature {}

class _CertificationFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch
  final Rxn<RequestCertificationsResponse> certifiationsResponse = Rxn();
  String get certificationToken =>
      certifiationsResponse.value?.data.certificationToken ?? "";

  CertificationInfo? get info =>
      certifiationsResponse.value?.data.certificationInfo;

  String get memberName => info?.username ?? "";
  String get birthDay => info?.birthDay ?? "";
  String get phone => info?.phone ?? "";

  Future certificate(String uid) async {
    final result = await AuthApi.certificate(uid);

    result.when(
      (e) => (apiError.value = e),
      (response) => (certifiationsResponse.value = response),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}
