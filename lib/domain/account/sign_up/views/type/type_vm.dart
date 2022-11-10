import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/data/models/member_types.dart';

class SignupTypeViewModel extends GetxController {
  SignupViewModel _signupVm = Get.find<SignupViewModel>();

  Rx<MemberTypes> memberType = Rx(MemberTypes.normal);
  RxString companyName = RxString('');

  bool get buttonDisabled {
    if (memberType.value == MemberTypes.normal) return false;

    return companyName.isEmpty;
  }

  save() {
    _signupVm.memberType = memberType.value;
    _signupVm.companyName = companyName.value;
  }
}
