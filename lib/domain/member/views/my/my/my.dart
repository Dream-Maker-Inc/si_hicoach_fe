import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/summary.dart';

class MemberMypageView extends StatelessWidget {
  const MemberMypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '마이페이지'),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const <Widget>[
              MemberMypageSummaryView(),
              MemberMypageMenuView(),
            ],
          ),
        ),
      ),
    );
  }
}
