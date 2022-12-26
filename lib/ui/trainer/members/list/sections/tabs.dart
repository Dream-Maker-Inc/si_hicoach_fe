// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/member_list_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/sections/list/member_list.dart';

class MemberListTabs extends StatefulWidget {
  const MemberListTabs({Key? key}) : super(key: key);

  @override
  State<MemberListTabs> createState() => _MemberListTabsState();
}

class _MemberListTabsState extends State<MemberListTabs>
    with SingleTickerProviderStateMixin {
  final TrainerMemberListViewModel _vm = Get.find<TrainerMemberListViewModel>();

  late final tabController = TabController(length: 2, vsync: this);

  _handleTabChange(int index) {
    _vm.tabIndex.value = index;
  }

  @override
  void initState() {
    super.initState();

    tabController.addListener(() {
      _vm.tabIndex.value = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: TabBar(
              controller: tabController,
              tabs: const <Widget>[
                Tab(text: '수강 중'),
                Tab(text: '수강 완료'),
              ],
              labelColor: primaryColor,
              unselectedLabelColor: Colors.black87,
              labelStyle: labelLarge,
              unselectedLabelStyle: labelLarge.copyWith(
                fontWeight: FontWeight.w400,
              ),
              onTap: _handleTabChange,
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: CustomDivider(),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            _InClassMembersListView(),
            _FinishedMembersListView(),
          ],
        ),
      ),
    );
  }

  Widget _InClassMembersListView() {
    return Obx(() {
      final inClassMembers = _vm.inClassMembers;

      return MemberListView(list: inClassMembers);
    });
  }

  Widget _FinishedMembersListView() {
    return Obx(() {
      final finishedMembers = _vm.finishedMembers;

      return MemberListView(list: finishedMembers);
    });
  }
}
