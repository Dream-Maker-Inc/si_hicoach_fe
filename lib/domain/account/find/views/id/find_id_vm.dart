import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class FindIdViewModel extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  RxString findedId = RxString('');

  Future findId(String certificationToken) async {
    final result = await MemberApi.findId(certificationToken);

    result.when((e) => (apiError.value = e), (res) {
      findedId.value = res.data;
    });
  }
}
