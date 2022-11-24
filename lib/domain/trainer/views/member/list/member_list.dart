import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/add.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/tabs.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/title.dart';

class MemberListView extends StatefulWidget {
  const MemberListView({Key? key}) : super(key: key);

  @override
  State<MemberListView> createState() => _MemberListViewState();
}

class _MemberListViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

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
      body: SafeArea(child: Obx(() {
        final totalCount = _vm.totalMemberCount;

        return Column(
          children: <Widget>[
            MemberListTitle(totalCount: totalCount),
            MemberListTabs(),
          ],
        );
      })),
    );
  }
}

class _Detail extends State<MemberListView> {
  late MemberListViewModel _vm;

  handleAddButtonPressed() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (BuildContext context) => const AddView(),
          ),
        )
        .then((value) => _vm.fetchInClassMembers());
  }

  @override
  void initState() {
    super.initState();

    Get.delete<MemberListViewModel>();
    _vm = Get.put(MemberListViewModel());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vm.fetchInClassMembers();
    });

    return const SizedBox.shrink();
  }
}

class MemberProps {
  final int id;
  final String name;
  final String matchedDate;
  final int latestStudyRound;
  final int totalStudyCount;

  MemberProps(
      {required this.id,
      required this.name,
      required this.matchedDate,
      required this.latestStudyRound,
      required this.totalStudyCount});
}
