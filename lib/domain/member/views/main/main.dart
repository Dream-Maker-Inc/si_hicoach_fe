import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/member/views/main/header.dart';
import 'package:si_hicoach_fe/domain/member/views/main/tab.dart';

class MemberHomeView extends StatelessWidget {
  const MemberHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '메인'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            MemberMainHeader(name: '이은석', date: 'ㅁㄴㅇㄹ'),
            MemberMainTab(),
          ],
        ),
      ),
    );
  }
}
