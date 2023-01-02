// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/information/information.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/panels/studies/studying_list.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/header/tabs_header.dart';

class DetailView extends StatefulWidget {
  final int memberId;

  DetailView({
    super.key,
    required this.memberId,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      final memberName = vm.member.name;
      final isPersonal = vm.isPersonalMatching2;

      final actionsWidget = [
        !isPersonal
            ? IconButton(
                icon: const SizedBox(
                  width: 20,
                  child: Icon(Icons.delete_outline),
                ),
                onPressed: onMemberDeleteIconPressed,
              )
            : Container()
      ];

      return Scaffold(
        appBar: CustomAppBarArrowBack(
          titleText: '$memberName 님',
          actionsWidget: actionsWidget,
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
                            children: [
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
    });
  }
}

class _Detail extends MyGetXState<DetailView, MemberDetailViewModel> {
  int get memberId => widget.memberId;

  onMemberDeleteIconPressed() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '회원 매칭 취소',
        content:
            '회원 매칭을 취소하시면\n\n - 해당 회원의 예약 수업 정보 모두 삭제\n - 회원 리스트에서 해당 회원 조회 불가\n\n처리됩니다.',
        positiveText: '매칭 취소하기',
        onPositivePressed: () => vm.removeMatching(vm.matchingId),
        negativeText: '뒤로',
        onNegativePressed: () => Get.back(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    vm.removeMatchingSuccess.listen((b) {
      if (!b) return;

      showMySimpleDialog(
          context: context,
          title: "매칭 취소",
          content: "${vm.member.name} 회원님과 매칭이 종료되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchMemberInfo(memberId);
    });

    return widget;
  }

  @override
  MemberDetailViewModel createViewModel() =>
      MemberDetailViewModel(memberId: memberId);
}
