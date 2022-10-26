import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/app_bar/arrow_back_icon.dart';
import 'package:si_hicoach_fe/domain/common/buttons.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/common/sign_up/input_header.dart';
import 'package:si_hicoach_fe/domain/member/sign_up/finish/finish.dart';

class SignUpInformationView extends StatefulWidget {
  const SignUpInformationView({Key? key}) : super(key: key);

  @override
  State<SignUpInformationView> createState() => _SignUpInformationPageState();
}

class _SignUpInformationPageState extends State<SignUpInformationView> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();

  void _handleIDValidationButtonClicked() {
    print('_handleIDValidationButtonClicked');
  }

  void _handleSubmitButtonClicked() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUpFinishView(),
        ),
      );
    }
  }

  _validatePassword(String value) {
    if (value.trim().isEmpty) {
      return '비밀번호를 입력해 주세요.';
    }
  }

  _validatePasswordRepeat(String value) {
    if (value.trim().isEmpty) {
      return '비밀번호를 입력해 주세요.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(titleText: '회원가입'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.8,
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SignUpInputHeader(
                    title: '아이디 (이메일)',
                    description: '실제 사용하시는 이메일 주소를 정확히 입력해 주세요.',
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: SizedBox(
                          height: 70,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '아이디 (이메일) 입력',
                              labelText: '아이디 (이메일) 입력',
                              suffix: TextButton(
                                onPressed: _handleIDValidationButtonClicked,
                                child: const Text('중복 확인'),
                              ),
                            ),
                            controller: _idController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SignUpInputHeader(
                    title: '비밀번호',
                    description: '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.',
                  ),
                  Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '비밀번호 입력',
                        labelText: '비밀번호 입력',
                      ),
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) => _validatePassword(value!),
                    ),
                  ),
                  const SignUpInputHeader(
                    title: '비밀번호 확인',
                    description: '비밀번호를 다시 한 번 입력해 주세요.',
                  ),
                  Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '비밀번호 입력',
                        labelText: '비밀번호 입력',
                      ),
                      obscureText: true,
                      controller: _passwordRepeatController,
                      validator: (value) => _validatePasswordRepeat(value!),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
              ),
              child: CustomElevatedButton(
                onPressed: _handleSubmitButtonClicked,
                text: '다음',
              ),
            )
          ],
        ),
      ),
    );
  }
}
