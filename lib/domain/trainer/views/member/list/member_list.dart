import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/add.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/tab.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/title.dart';

class TrainerMemberListView extends StatelessWidget {
  const TrainerMemberListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithLogo(
        titleText: '회원 관리',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const TrainerMemberAddView(),
                ),
              );
            },
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            MemberListTitle(),
            SizedBox(height: defaultPadding),
            MemberListTab(),
          ],
        ),
      ),
    );
  }
}
