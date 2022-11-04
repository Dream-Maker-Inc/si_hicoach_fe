import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/tabs/tab.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/agreement.dart';
import 'package:si_hicoach_fe/domain/common/components/alert.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/member/views/base.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String?> _showErrorDialog() {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '로그인 정보 확인',
        content: '아이디 또는 비밀번호를 확인해 주세요.',
        positiveText: '확인',
        onPositivePressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  void _handleLoginButtonClicked() {
    bool isFormValid =
        _emailController.text.isNotEmpty || _passwordController.text.isNotEmpty;

    if (isFormValid) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MemberBaseView()),
        (Route<dynamic> route) => false,
      );
    } else {
      _showErrorDialog();
    }
  }

  _handleSignUpButtonClicked() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignUpAgreementView()),
    );
  }

  _handleTextButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const InformationFindView()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  style: Theme.of(context).textTheme.headline4,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        hintText: '아이디 (이메일)을 입력하세요.',
                        controller: _emailController,
                      ),
                      const SizedBox(height: defaultPadding),
                      CustomTextField(
                        isPassword: true,
                        hintText: '비밀번호를 입력하세요.',
                        controller: _passwordController,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: _handleTextButtonPressed,
                          child: const Text(
                            '회원정보 찾기',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          onPressed: _handleLoginButtonClicked,
                          text: '로그인',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 90),
                child: Text(
                  '아직 회원이 아니세요?',
                  style: Theme.of(context).textTheme.headline4,
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
                  onPressed: _handleSignUpButtonClicked,
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
