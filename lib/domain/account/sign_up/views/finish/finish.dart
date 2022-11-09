import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/exceptions/signup_exceptions.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/signup_vm.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:get/get.dart';

class SignUpFinishView extends StatelessWidget {
  final _vm = Get.find<SignupViewModel>();

  SignUpFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _vm.signupError.listen((e) {
      print('SignUpFinishView listen : $e');
    });

    if(_vm.signupError is MissingRequiredTermException) {
      print("catch MissingRequiredTermException");
    }

    handleSubmitButtonPressed() {
      // vm.signup();
      _vm.signup();

      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: (context) => const LoginView(),
      //   ),
      //   (Route<dynamic> route) => false,
      // );
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
                  color: colorScheme.primary,
                  backgroundColor: colorScheme.primary.withAlpha(40),
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
