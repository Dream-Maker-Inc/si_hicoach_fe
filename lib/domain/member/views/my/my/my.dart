import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/summary.dart';

class MypageView extends StatelessWidget {
  const MypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '마이페이지'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              SummaryView(),
              MenuView(),
            ],
          ),
        ),
      ),
    );
  }
}
