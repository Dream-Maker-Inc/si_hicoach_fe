import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/finish/finish.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/information/information_vm.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/signup_vm.dart';

class SignUpInformationView extends StatefulWidget {
  const SignUpInformationView({Key? key}) : super(key: key);

  @override
  State<SignUpInformationView> createState() => _SignUpInformationViewState();
}

class _SignUpInformationViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  LinearProgressIndicator(
                    value: 0.8,
                    color: primaryColor,
                    backgroundColor: primaryColor.withAlpha(40),
                  ),
                  Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: <Widget>[
                        const TitleWithDescription(
                          title: '아이디 (이메일)',
                          description: '실제 사용하시는 이메일 주소를 정확히 입력해 주세요.',
                        ),
                        SizedBox(
                          child: _buildEmailTextField(),
                        ),
                        const SizedBox(height: defaultPadding),
                        const TitleWithDescription(
                          title: '비밀번호',
                          description:
                              '영문 대·소문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.\n\n*사용 가능한 특수문자 : !@#\$%^&*',
                        ),
                        _buildPwTextField(),
                        const SizedBox(height: defaultPadding),
                        const TitleWithDescription(
                          title: '비밀번호 확인',
                          description: '비밀번호를 다시 한 번 입력해 주세요.',
                        ),
                        _buildPwRepeatTextField(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _buildSubmitButton()
                ],
              ),
            )
          ],
        ));
  }

  _buildSubmitButton() {
    return Obx(() {
      final buttonDisabled = vm.buttonDisabled;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: CustomElevatedButton(
          onPressed: !buttonDisabled ? _handleSubmitButtonClicked : null,
          text: '다음',
        ),
      );
    });
  }

  _buildPwRepeatTextField() {
    return Obx(() {
      final pwRepeat = vm.pwRepeat.value;
      final pwRepeatErrorText = vm.pwRepeatErrorText;

      return CustomTextField(
        hintText: '비밀번호 입력',
        isPassword: true,
        value: pwRepeat,
        onChanged: _handlePasswordRepeatInputChanged,
        errorText: pwRepeatErrorText,
      );
    });
  }

  _buildPwTextField() {
    return Obx(() {
      final password = vm.password.value;
      final passwordErrorText = vm.passwordErrorText;

      return CustomTextField(
        hintText: '비밀번호 입력',
        isPassword: true,
        value: password,
        onChanged: _handlePasswordInputChanged,
        errorText: passwordErrorText,
      );
    });
  }

  _buildEmailTextField() {
    return Obx(() {
      final email = vm.email.value;
      final isValidEmail = vm.isValidEmail;
      final emailErrorText = vm.emailErrorText;

      return CustomTextField(
        hintText: '아이디 (이메일) 입력',
        keyboardType: TextInputType.emailAddress,
        value: email,
        onChanged: _handleIDInputChanged,
        errorText: emailErrorText,
        suffix: isValidEmail ? _buildValidateButton(email) : null,
      );
    });
  }

  _buildValidateButton(String email) {
    return CustomElevatedButton(
      onPressed: vm.validateEmailButtonDisabled
          ? () => _handleIDValidationButtonClicked(email)
          : null,
      text: '중복 확인',
    );
  }
}

class _Detail
    extends MyGetXState<SignUpInformationView, SignupInformationViewModel> {
  final SignupViewModel _signupVm = Get.find<SignupViewModel>();

  _handleIDInputChanged(String value) {
    vm.email.value = value;
  }

  _handleIDValidationButtonClicked(String value) {
    vm.validateEmail(value);
  }

  _handlePasswordInputChanged(String value) {
    vm.password.value = value;
  }

  _handlePasswordRepeatInputChanged(String value) {
    vm.pwRepeat.value = value;
  }

  _handleSubmitButtonClicked() {
    vm.submit();
  }

  _navigateNextPage() {
    Get.offAll(const SignUpFinishView());
  }

  @override
  void initState() {
    super.initState();

    _signupVm.signupSuccess.listen((b) {
      if (!b) return;

      _navigateNextPage();
    });

    _signupVm.signupError.listen((e) {
      showMySimpleDialog(
          context: context, title: "error", content: e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  SignupInformationViewModel createViewModel() => SignupInformationViewModel();
}
