import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/buttons.dart';
import 'package:si_hicoach_fe/common/color_schemes.dart';
import 'package:si_hicoach_fe/common/constants.dart';
import 'package:si_hicoach_fe/common/sign_up/input_header.dart';

class SignUpInformationPage extends StatefulWidget {
  const SignUpInformationPage({Key? key}) : super(key: key);

  @override
  State<SignUpInformationPage> createState() => _SignUpInformationPageState();
}

class _SignUpInformationPageState extends State<SignUpInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();

  String idValue = '';
  String passwordValue = '';
  String passwordRepeatValue = '';

  void _handleIDValidationButtonClicked() {
    print('_handleIDValidationButtonClicked');
  }

  void _handleSubmitButtonClicked() {
    print('_handleSubmitButtonClicked');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.6,
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
            ),
            Form(
              child: Column(
                children: <Widget>[
                  const SignUpInputHeader(
                    title: '아이디 (이메일)',
                    description: '실제 사용하시는 이메일 주소를 정확히 입력해 주세요.',
                  ),
                  Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '아이디 (이메일) 입력',
                              labelText: '아이디 (이메일) 입력',
                            ),
                            controller: _idController,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return '이메일을 입력해 주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomOutlinedButton(
                            text: '인증하기',
                            onPressed: _handleIDValidationButtonClicked,
                          ),
                        ),
                      ],
                    ),
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
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '비밀번호를 입력해 주세요.';
                        }
                        return null;
                      },
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '비밀번호를 입력해 주세요.';
                        }
                        return null;
                      },
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
