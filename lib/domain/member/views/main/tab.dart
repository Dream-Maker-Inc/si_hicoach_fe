import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/member/views/main/grid.dart';

class MemberMainTab extends StatelessWidget {
  const MemberMainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabTitle = ['완료 수업', '오늘 수업', '예정 수업'];
    List<Widget> tabBar = <Widget>[
      MemberMainGridView(),
      MemberMainGridView(),
      MemberMainGridView(),
    ];

    PreferredSizeWidget memberMainAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          tabs: <Widget>[
            for (var item in tabTitle) Tab(text: item, height: 54)
          ],
          labelColor: primaryColor,
          unselectedLabelColor: Colors.black,
          labelStyle: labelLarge,
          unselectedLabelStyle: labelLarge.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: CustomDivider(),
        ),
      );
    }

    return Expanded(
      flex: 1,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: memberMainAppBar(),
          body: TabBarView(children: tabBar),
        ),
      ),
    );
  }
}
