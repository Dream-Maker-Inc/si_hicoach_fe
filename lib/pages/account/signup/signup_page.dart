import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/agreement.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignupViewModel());
    return const SignUpAgreementView();
  }
}
