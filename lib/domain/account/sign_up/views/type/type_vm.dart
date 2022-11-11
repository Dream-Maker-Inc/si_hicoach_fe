import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/data/models/member_types.dart';

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

  handleMemberTypeChange(index) {
    memberType.value =MemberTypes.values[index];
  }

  save() {
    _signupVm.memberType = memberType.value;
    _signupVm.companyName = companyName.value;
  }
}
