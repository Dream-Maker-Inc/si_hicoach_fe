import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/data/models/member_types.dart';

class SignupTypeViewModel extends GetxController {
  Rx<MemberTypes> memberType = Rx(MemberTypes.normal);
  RxString companyName = RxString('');

  bool get buttonDisabled {
    if (memberType.value == MemberTypes.normal) return false;

    return companyName.isEmpty;
  }
}
