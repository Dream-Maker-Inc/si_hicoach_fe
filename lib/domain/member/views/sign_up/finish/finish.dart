import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/buttons.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/common/sign_up/input_header.dart';
import 'package:si_hicoach_fe/domain/member/views/login/login.dart';

class SignUpFinishPage extends StatelessWidget {
  const SignUpFinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: 1,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
                ),
                const SignUpInputHeader(
                  title: '회원가입 완료',
                  description: '하이코치 회원가입을 축하드립니다.',
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(defaultPadding),
                child: CustomElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (Route<dynamic> route) => false,
                  ),
                  text: '완료',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
