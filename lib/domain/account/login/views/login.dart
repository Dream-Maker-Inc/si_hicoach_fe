import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/tabs/tab.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login_vm.dart';
import 'package:si_hicoach_fe/domain/member/views/base.dart';
import 'package:si_hicoach_fe/domain/trainer/views/base.dart';
import 'package:si_hicoach_fe/pages/account/signup/signup_page.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel _vm;

  _handleEmailInputChanged(String value) {
    _vm.email.value = value;
  }

  _handlePasswordInputChanged(String value) {
    _vm.password.value = value;
  }

  _handleLoginButtonClicked(BuildContext ctx) {
    _vm.submit();
  }

  _handleSignUpButtonClicked(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }

  _handleTextButtonPressed(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => const InformationFindView()),
    );
  }

  _navigateMainPage(bool isTrainer) {
    if (isTrainer) {
      return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TrainerBaseView()),
      );
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MemberBaseView()),
    );
  }

  @override
  void initState() {
    super.initState();

    Get.delete<LoginViewModel>();
    _vm = Get.put(LoginViewModel());

    _vm.loginSuccess.listen((isSuccess) {
      if (!isSuccess) return;
      if (_vm.isRoleTrainer.value == null) return;

      _navigateMainPage(_vm.isRoleTrainer.value!);
      _vm.clear();
    });

    _vm.loginError.listen((e) {
      print("Todo: show exception dialog :$e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Obx(() {
      final email = _vm.email.value;
      final password = _vm.password.value;

      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: 100,
                bottom: defaultPadding,
              ),
              child: Text(
                '퍼스널 트레이닝을 더 가치있게',
                style: bodySmall.copyWith(
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Image(image: AssetImage('assets/logo.png')),
            Container(
              padding: const EdgeInsets.only(
                top: 90,
                left: defaultPadding,
                right: defaultPadding,
              ),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: '아이디 (이메일)을 입력하세요.',
                    value: email,
                    onChanged: _handleEmailInputChanged,
                  ),
                  const SizedBox(height: defaultPadding),
                  CustomTextField(
                    isPassword: true,
                    hintText: '비밀번호를 입력하세요.',
                    value: password,
                    onChanged: _handlePasswordInputChanged,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => _handleTextButtonPressed(context),
                      child: Text(
                        '계정을 잊으셨나요?',
                        style: bodySmall.copyWith(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: !_vm.buttonDisabled
                          ? () => _handleLoginButtonClicked(context)
                          : null,
                      text: '로그인',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: Text(
                '아직 회원이 아니세요?',
                style: bodySmall.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: smallPadding,
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding,
              ),
              width: double.infinity,
              child: CustomOutlinedButton(
                onPressed: () => _handleSignUpButtonClicked(context),
                text: '30초 회원가입',
              ),
            ),
          ],
        ),
      );
    })));
  }
}