import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/member/views/main/tab.dart';

class MemberMainView extends StatelessWidget {
  const MemberMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithLogo(titleText: '이은석 회원님'),
      body: SizedBox(
        width: double.infinity,
        child: MemberMainTab(),
      ),
    );
  }
}
