import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/terms/terms.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';

// 회원가입 플로우 시작점
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends MyGetXState<SignupPage, SignupViewModel> {
  @override
  Widget build(BuildContext context) {
    return const SignUpTermsView();
  }

  @override
  SignupViewModel createViewModel() => SignupViewModel();
}
