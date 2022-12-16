import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/agreement.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    super.initState();

    Get.delete<SignupViewModel>();
    Get.put(SignupViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return const SignUpAgreementView();
  }
}
