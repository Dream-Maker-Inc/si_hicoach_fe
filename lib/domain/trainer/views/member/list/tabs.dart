import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/studying/studying_list.dart';

class MemberListTabs extends StatelessWidget {
  MemberListTabs({Key? key}) : super(key: key);

  final MemberListViewModel _vm = Get.find<MemberListViewModel>();

  _handleTabChange(int index) {
    _vm.tabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: TabBar(
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
          body: _buildTabBarView(),
        ),
      ),
    );
  }

  _buildTabBarView() {
    return GetBuilder<MemberListViewModel>(builder: (vm) {
      final inClassMembers = _vm.inClassMembers;
      final finishedMembers = _vm.finishedMembers;

      Logger().i(inClassMembers);

      return TabBarView(children: [
        StudyingListView(list: inClassMembers),
        StudyingListView(list: finishedMembers),
      ]);
    });
  }
}
