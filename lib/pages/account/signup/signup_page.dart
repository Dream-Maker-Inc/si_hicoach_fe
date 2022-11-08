import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/finish/finish.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/finish/finish_vm.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupFinishViewModel>(
        create: (_) => SignupFinishViewModel(),
        child: SignUpFinishView());
  }
}