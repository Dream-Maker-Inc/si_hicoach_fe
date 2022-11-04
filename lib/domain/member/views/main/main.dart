import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/member/views/main/tab.dart';

class MemberMainView extends StatelessWidget {
  const MemberMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '메인'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: TitleWithDescription(
                  title: '이은석 회원님', description: '2022년 10월 10일'),
            ),
            MemberMainTab(),
          ],
        ),
      ),
    );
  }
}
