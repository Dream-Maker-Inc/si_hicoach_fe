import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';

class IDFindSuccessView extends StatelessWidget {
  final String id;

  const IDFindSuccessView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonPressed() {
      Get.offAll(const LoginView());
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '아이디 (이메일) 찾기'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TitleWithDescription(
                title: '아이디 (이메일) 찾기',
                description: '인증하신 정보와 일치하는 아이디를 찾았습니다.'),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              child: Center(child: Text(id)),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressed: handleSubmitButtonPressed,
                text: '로그인 하러 가기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
