import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/type.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class SignUpVerifyView extends StatelessWidget {
  const SignUpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    handleNextButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const SignUpTypeView(),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.4,
              color: primaryColor,
              backgroundColor: primaryColor.withAlpha(40),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(defaultPadding),
              child: CustomElevatedButton(
                text: '다음',
                onPressed: handleNextButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
