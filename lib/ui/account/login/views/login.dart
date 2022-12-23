import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/account/find/views/info_find/info_find.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login_vm.dart';
import 'package:si_hicoach_fe/domain/member/views/base.dart';
import 'package:si_hicoach_fe/ui/trainer/base.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/signup_page.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(body: SafeArea(child: Obx(() {
      final email = vm.email.value;
      final password = vm.password.value;

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
            const Image(
              image: AssetImage('assets/logo.png'),
              width: 260,
            ),
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
                    onChanged: _handleEmailChange,
                  ),
                  const SizedBox(height: defaultPadding),
                  CustomTextField(
                    isPassword: true,
                    hintText: '비밀번호를 입력하세요.',
                    value: password,
                    onChanged: _handlePasswordChange,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => _handleFindAccountClick(),
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
                      onPressed: !vm.buttonDisabled
                          ? () => _handleLoginButtonClick()
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
                onPressed: () => _handleSignUpButtonClick(),
                text: '30초 회원가입',
              ),
            ),
            // TODO: DELETE
            ElevatedButton(
                onPressed: () {
                  vm.testUserLogin();
                },
                child: const Text("테스트 유저 로그인"))
            // TODO: DELETE
          ],
        ),
      );
    })));
  }
}

class _Detail extends MyGetXState<LoginView, LoginViewModel> {
  _handleEmailChange(String value) {
    vm.email.value = value;
  }

  _handlePasswordChange(String value) {
    vm.password.value = value;
  }

  _handleLoginButtonClick() {
    vm.submit();
  }

  _handleSignUpButtonClick() {
    Get.to(const SignupPage());
  }

  _handleFindAccountClick() {
    Get.to(const InformationFindView());
  }

  _navigateConditionalMainPage() {
    if (!mounted) return;

    if (vm.isRoleTrainer) {
      return Get.off(const TrainerBaseView());
    }

    Get.off(const MemberBaseView());
  }

  String _getErrorMessage(Exception? e) {
    if (e is NotExistException) return "아이디가 존재하지 않습니다.";
    if (e is UnauthorizedException) return "아이디 혹은 비밀번호가 맞지 않습니다.";

    Logger().e(e);

    return "알 수 없는 에러";
  }

  @override
  void initState() {
    super.initState();

    vm.addDeviceSuccess.listen((b) {
      if (!b) return;

      _navigateConditionalMainPage();
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      showMySimpleDialog(
        context: context,
        title: "로그인 실패",
        content: _getErrorMessage(e),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  LoginViewModel createViewModel() => LoginViewModel();
}
