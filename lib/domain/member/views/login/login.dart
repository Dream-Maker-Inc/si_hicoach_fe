import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/buttons.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/member/views/find/account_find_tab/account_find_tab.dart';
import 'package:si_hicoach_fe/domain/member/views/sign_up/agreement/agreement.dart';
import 'package:si_hicoach_fe/domain/trainer/base.dart';

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

  void _handleLoginButtonClicked() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TrainerBaseView(),
        ),
      );
    }
  }

  _handleSignUpButtonClicked() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpAgreementView(),
      ),
    );
  }

  _validateEmail(String value) {
    if (value.trim().isEmpty) {
      return '아이디(이메일)을 입력해 주세요.';
    }
  }

  _validatePassword(String value) {
    if (value.trim().isEmpty) {
      return '비밀번호를 입력해 주세요.';
    }
  }

  _handleTextButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AccountFindTabView(),
      ),
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
                  style: Theme.of(context).textTheme.overline,
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
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '아이디 (이메일)을 입력하세요.',
                          labelText: '아이디 (이메일)',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) => _validateEmail(value!),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: defaultPadding),
                        width: double.infinity,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '비밀번호를 입력하세요.',
                            labelText: '비밀번호',
                          ),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) => _validatePassword(value!),
                        ),
                      ),
                      Container(
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
                      Container(
                        margin: const EdgeInsets.only(top: defaultPadding),
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
                  style: Theme.of(context).textTheme.overline,
                  textAlign: TextAlign.center,
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
