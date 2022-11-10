import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/tabs/tab.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/agreement.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/member/views/base.dart';
import 'package:si_hicoach_fe/domain/trainer/views/base.dart';
import 'package:si_hicoach_fe/pages/account/signup/signup_page.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  _handleEmailInputChanged(String value) {
    print('입력한 이메일 : $value');
  }

  _handlePasswordInputChanged(String value) {
    print('입력한 비밀번호 : $value');
  }

  @override
  Widget build(BuildContext context) {
    handleLoginButtonClicked() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MemberBaseView()),
      );
    }

    handleSignUpButtonClicked() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignupPage()),
      );
    }

    handleTextButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const InformationFindView()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      onChanged: _handleEmailInputChanged,
                    ),
                    const SizedBox(height: defaultPadding),
                    CustomTextField(
                      isPassword: true,
                      hintText: '비밀번호를 입력하세요.',
                      onChanged: _handlePasswordInputChanged,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: handleTextButtonPressed,
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
                        onPressed: handleLoginButtonClicked,
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
                  onPressed: handleSignUpButtonClicked,
                  text: '30초 회원가입',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
