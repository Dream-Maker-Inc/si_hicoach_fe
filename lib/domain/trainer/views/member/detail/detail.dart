// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/study/create/study_create.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/information.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/study/studying_list.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tab/header.dart';

class DetailView extends StatefulWidget {
  DetailView({super.key, required this.memberId});

  final int memberId;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final member = _vm.member;
    //

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '${member.name} 님',
        actionsWidget: <Widget>[
          IconButton(
            icon: const SizedBox(width: 20, child: Icon(Icons.delete_outline)),
            onPressed: () => onMemberDeleteIconPressed(context),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Header(),
                  ),
                  body: Column(
                    children: <Widget>[
                      const CustomDivider(),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Information(),
                            StudyingListView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Detail extends State<DetailView> {
  late MemberDetailViewModel _vm;

  onStudyAddIconPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => StudyEditView(
            matchingId: _vm.matchingId,
            latestStudyRound: 1,
            totalStudyCount: _vm.latestStudy.totalStudyCount),
      ),
    );
  }

  onMemberDeleteIconPressed(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '회원 매칭 취소',
        content:
            '회원 매칭을 취소하시면\n\n - 해당 회원의 예약 수업 정보 모두 삭제\n - 회원 리스트에서 해당 회원 조회 불가\n\n처리됩니다.',
        positiveText: '매칭 취소하기',
        onPositivePressed: () => _vm.removeMatching(),
        negativeText: '뒤로',
        onNegativePressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Get.delete<MemberDetailViewModel>();
    _vm = Get.put(MemberDetailViewModel());

    _vm.memberId = widget.memberId;

    _vm.fetchMemberPageResponse.listen((it) {
      if (it == null) return;
      setState(() {});
    });

    _vm.fetchMemberStudiesResponse.listen((it) {
      if (it == null) return;
      setState(() {});
    });

    _vm.removeMatchingSuccess.listen((b) {
      if (!b) return;

      Get.defaultDialog(
          title: "매칭 취소",
          content: Text("${_vm.member.name} 회원님과 매칭이 종료되었습니다."),
          textConfirm: "확인",
          onConfirm: () {
            Get.back();
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => {_vm.fetchMemberInfo()});

    return const SizedBox.shrink();
  }
}
