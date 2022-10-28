import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/trainer/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/trainer/my/my/summary.dart';

class TrainerMypageView extends StatelessWidget {
  const TrainerMypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: colorScheme.onTertiary,
            height: 1,
          ),
        ),
      ),
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
