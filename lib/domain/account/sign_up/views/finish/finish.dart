import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login.dart';

class SignUpFinishView extends StatelessWidget {
  const SignUpFinishView({Key? key}) : super(key: key);

  _handleSubmitButtonPressed(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  color: primaryColor,
                  backgroundColor: primaryColor.withAlpha(40),
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
                  onPressed: () => _handleSubmitButtonPressed(context),
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
