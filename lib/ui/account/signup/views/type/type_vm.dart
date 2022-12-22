import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/signup_vm.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/type/models/member_types.dart';

class SignupTypeViewModel extends GetxController {
  final SignupViewModel _signupVm = Get.find<SignupViewModel>();

  Rx<MemberTypes> memberType = Rx(MemberTypes.normal);
  RxString companyName = RxString('');

  List<bool> get isTrainerPair {
    final isTrainer = memberType.value == MemberTypes.trainer;

    return [isTrainer, !isTrainer];
  }

  bool get buttonDisabled {
    if (memberType.value == MemberTypes.normal) return false;

    return companyName.isEmpty;
  }

  handleMemberTypeChange(int index) {
    memberType.value = MemberTypes.values[index];
  }

  saveToSignupViewModel() {
    _signupVm.memberType = memberType.value;
    _signupVm.companyName = companyName.value;
  }
}
