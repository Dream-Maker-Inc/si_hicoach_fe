import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/member/views/main/grid.dart';

class MemberMainTab extends StatelessWidget {
  const MemberMainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabTitle = ['직전 완료 수업', '오늘 수업', '다음 예정 수업'];
    List<Widget> tabBar = <Widget>[
      MemberMainGridView(),
      MemberMainGridView(),
      MemberMainGridView(),
    ];

    TextStyle appBarTextStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );

    PreferredSizeWidget memberMainAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          tabs: <Widget>[for (var item in tabTitle) Tab(text: item)],
          labelColor: colorScheme.primary,
          unselectedLabelColor: Colors.black,
          labelStyle: appBarTextStyle,
          unselectedLabelStyle: appBarTextStyle,
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
