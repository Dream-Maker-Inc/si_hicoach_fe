import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '훨씬 나은 운동일지 관리',
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            const Image(image: AssetImage('assets/logo.png')),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '아이디 (이메일)을 입력하세요.',
                        labelText: '아이디 (이메일)',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '비밀번호를 입력하세요.',
                        labelText: '비밀번호',
                      ),
                      obscureText: true,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: _handleLoginButtonPressed,
                          child: const Text('로그인')),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLoginButtonPressed() {}
}
