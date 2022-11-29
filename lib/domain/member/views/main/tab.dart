import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/member/views/main/main_vm.dart';
import 'package:si_hicoach_fe/domain/member/views/main/past/grid.dart';
import 'package:si_hicoach_fe/domain/member/views/main/present/list.dart';

class MemberMainTab extends StatefulWidget {
  const MemberMainTab({Key? key}) : super(key: key);

  @override
  State<MemberMainTab> createState() => _MemberMainTabState();
}

class _MemberMainTabState extends State<MemberMainTab>
    with SingleTickerProviderStateMixin {
  MainPageViewModel vm = Get.find<MainPageViewModel>();

  List<String> tabTitle = ['완료 수업', '오늘 수업', '예정 수업'];
  late final tabController =
      TabController(length: tabTitle.length, vsync: this);

  @override
  void initState() {
    super.initState();

    tabController.addListener(() {
      vm.tabIndex.value = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabBar = <Widget>[
      PastGridView(),
      PresentListView(),
      PresentListView(),
    ];

    PreferredSizeWidget memberMainAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          controller: tabController,
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
      child: Scaffold(
        appBar: memberMainAppBar(),
        body: TabBarView(controller: tabController, children: tabBar),
      ),
    );
  }
}
