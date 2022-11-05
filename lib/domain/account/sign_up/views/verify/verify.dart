import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/type.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class SignUpVerifyView extends StatelessWidget {
  const SignUpVerifyView({super.key});

  _handleNextButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const SignUpTypeView(),
      ),
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
            LinearProgressIndicator(
              value: 0.4,
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(defaultPadding),
              child: CustomElevatedButton(
                  text: '다음',
                  onPressed: () => _handleNextButtonPressed(context)),
            ),
          ],
        ),
      ),
    );
  }
}
