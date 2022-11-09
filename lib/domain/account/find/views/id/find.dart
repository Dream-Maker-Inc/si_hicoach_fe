import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/id/success.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';

class IDFindView extends StatelessWidget {
  const IDFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const IDFindSuccessView(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TitleWithDescription(
            title: '아이디 (이메일) 찾기',
            description: '아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: handleSubmitButtonPressed,
              text: '휴대폰 인증하기',
            ),
          )
        ],
      ),
    );
  }
}
