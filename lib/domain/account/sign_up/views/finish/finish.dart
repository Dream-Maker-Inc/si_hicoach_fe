import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login/login.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class SignUpFinishView extends StatelessWidget {
  const SignUpFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonPressed() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (Route<dynamic> route) => false,
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
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
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: TitleWithDescription(
                    title: '회원가입 완료',
                    description: '하이코치 회원가입을 축하드립니다.',
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(defaultPadding),
                child: CustomElevatedButton(
                  onPressed: handleSubmitButtonPressed,
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
