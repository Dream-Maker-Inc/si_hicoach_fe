import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/add.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/tab.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/title.dart';

class MemberProps {
  final String name;
  final String regDate;
  final int currentStudy;
  final int totalStudy;

  MemberProps(this.name, this.regDate, this.currentStudy, this.totalStudy);
}

class MemberListView extends StatelessWidget {
  MemberListView({Key? key}) : super(key: key);
  final List<MemberProps> list = [
    MemberProps('김종국', Utils.getCurrentDateTime('year_month_date'), 10, 20),
    MemberProps('박명수', Utils.getCurrentDateTime('year_month_date'), 20, 21),
    MemberProps('전소민', Utils.getCurrentDateTime('year_month_date'), 30, 22),
    MemberProps('홍길동', Utils.getCurrentDateTime('year_month_date'), 40, 23),
    MemberProps('서현진', Utils.getCurrentDateTime('year_month_date'), 50, 24),
    MemberProps('강하늘', Utils.getCurrentDateTime('year_month_date'), 60, 25),
    MemberProps('송강호', Utils.getCurrentDateTime('year_month_date'), 80, 26),
  ];

  @override
  Widget build(BuildContext context) {
    handleAddButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const AddView(),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBarWithLogo(
        titleText: '회원 관리',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: handleAddButtonPressed,
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MemberListTitle(list: list),
            MemberListTab(list: list),
          ],
        ),
      ),
    );
  }
}
