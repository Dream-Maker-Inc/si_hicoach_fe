import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/trainer/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/trainer/my/my/summary.dart';

class TrainerMypageView extends StatelessWidget {
  const TrainerMypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '마이페이지'),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: const <Widget>[
              TrainerMypageSummaryView(),
              TrainerMypageMenuView(),
            ],
          ),
        ),
      ),
    );
  }
}