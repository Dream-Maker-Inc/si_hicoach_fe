import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/update_my_info_dto.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';

class TrainerAccountUpdateViewModel extends GetxController {
  RxString initialCompanyName = RxString('');
  RxString companyName = RxString('');

  TrainerAccountUpdateViewModel({required String initialCompanyName}) {
    this.initialCompanyName.value = initialCompanyName;
    companyName.value = initialCompanyName;
  }

  Rx<Exception?> apiError = Rx(null);
  final RxBool updateMyCompanyResponse = RxBool(false);

  Future updateMyCompany() async {
    TrainerInfo trainerInfo = TrainerInfo(companyName.value);
    UpdateMyInfoDto dto = UpdateMyInfoDto(trainerInfo);

    final result = await MemberApi.updateMyInfo(dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (updateMyCompanyResponse.value = res),
    );
  }
}
