import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/add.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/member_list_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/sections/tabs.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/sections/tabs_header.dart';

class MemberListPage extends StatefulWidget {
  const MemberListPage({Key? key}) : super(key: key);

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarWithLogo(
        titleText: '회원 관리',
        actionsWidget: [
          IconButton(
            onPressed: handleAddButtonPressed,
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: SafeArea(child: _buildContents()),
    );
  }

  _buildContents() {
    return Obx(() {
      final totalCount = vm.totalMemberCount;

      return Column(
        children: [
          MemberListHeader(totalCount: totalCount),
          const MemberListTabs(),
        ],
      );
    });
  }
}

class _Detail extends MyGetXState<MemberListPage, MemberListViewModel> {
  handleAddButtonPressed() {
    Get.to(const AddView())?.then((_) => vm.refetch());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchInClassMembers();
    });

    return widget;
  }

  @override
  MemberListViewModel createViewModel() => MemberListViewModel();
}