import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/finish/finish.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/information/information_vm.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';

class SignUpInformationView extends StatefulWidget {
  const SignUpInformationView({Key? key}) : super(key: key);

  @override
  State<SignUpInformationView> createState() => _SignUpInformationViewState();
}

class _SignUpInformationViewState extends State<SignUpInformationView> {
  final SignupViewModel _signupVm = Get.find<SignupViewModel>();
  late SignupInformationViewModel _vm;

  _handleIDInputChanged(String value) {
    _vm.email.value = value;
  }

  _handleIDValidationButtonClicked(String value) {
    _vm.validateEmail(value);
  }

  _handlePasswordInputChanged(String value) {
    _vm.password.value = value;
  }

  _handlePasswordRepeatInputChanged(String value) {
    _vm.pwRepeat.value = value;
  }

  _handleSubmitButtonClicked() {
    _vm.submit();
  }

  _navigateNextPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SignUpFinishView(),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();

    Get.delete<SignupInformationViewModel>();
    _vm = Get.put(SignupInformationViewModel());

    _signupVm.signupSuccess.listen((isSuccess) {
      if (isSuccess) _navigateNextPage();
    });

    _signupVm.signupError.listen((e) {
      print("Todo: show exception dialog :$e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
      body: Obx(() {
        final email = _vm.email.value;
        final isValidEmail = _vm.isValidEmail;
        final emailErrorText = _vm.emailErrorText;

        final password = _vm.password.value;
        final passwordErrorText = _vm.passwordErrorText;

        final pwRepeat = _vm.pwRepeat.value;
        final pwRepeatErrorText = _vm.pwRepeatErrorText;

        final buttonDisabled = _vm.buttonDisabled;

        return CustomScrollView(
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
                          child: CustomTextField(
                            hintText: '아이디 (이메일) 입력',
                            keyboardType: TextInputType.emailAddress,
                            value: email,
                            onChanged: _handleIDInputChanged,
                            errorText: emailErrorText,
                            suffix: isValidEmail
                                ? _buildValidateButton(email)
                                : null,
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        const TitleWithDescription(
                          title: '비밀번호',
                          description:
                              '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.',
                        ),
                        CustomTextField(
                          hintText: '비밀번호 입력',
                          isPassword: true,
                          value: password,
                          onChanged: _handlePasswordInputChanged,
                          errorText: passwordErrorText,
                        ),
                        const SizedBox(height: defaultPadding),
                        const TitleWithDescription(
                          title: '비밀번호 확인',
                          description: '비밀번호를 다시 한 번 입력해 주세요.',
                        ),
                        CustomTextField(
                          hintText: '비밀번호 입력',
                          isPassword: true,
                          value: pwRepeat,
                          onChanged: _handlePasswordRepeatInputChanged,
                          errorText: pwRepeatErrorText,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(defaultPadding),
                    child: CustomElevatedButton(
                      onPressed:
                          !buttonDisabled ? _handleSubmitButtonClicked : null,
                      text: '다음',
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  _buildValidateButton(String email) {
    return CustomElevatedButton(
      onPressed: _vm.validateEmailButtonDisabled
          ? () => _handleIDValidationButtonClicked(email)
          : null,
      text: '중복 확인',
    );
  }
}
