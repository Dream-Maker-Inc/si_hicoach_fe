import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/my/summary.dart';

class MypageView extends StatelessWidget {
  const MypageView({Key? key}) : super(key: key);

  final String name = '이은석';
  final int currentStudy = 80;
  final int pastStudy = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '마이페이지'),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              TrainerMypageSummaryView(
                name: name,
                currentStudy: currentStudy,
                pastStudy: pastStudy,
              ),
              const MypageMenuView(),
            ],
          ),
        ),
      ),
    );
  }
}
