import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/buttons.dart';
import 'package:si_hicoach_fe/common/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleButtonPressed() {
    if (_formKey.currentState!.validate()) {
      print('ok');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                '훨씬 나은 운동일지 관리',
                style: Theme.of(context).textTheme.overline,
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
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '아이디(이메일)을 입력해 주세요.';
                        }
                        return null;
                      },
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
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return '비밀번호를 입력해 주세요.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: const TextButton(
                        onPressed: _handleTextButtonPressed,
                        child: Text(
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
                        onPressed: _handleButtonPressed,
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
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: smallPadding,
                left: defaultPadding,
                right: defaultPadding,
              ),
              width: double.infinity,
              child: CustomOutlinedButton(
                onPressed: () {},
                text: '30초 회원가입',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _handleTextButtonPressed() {}
