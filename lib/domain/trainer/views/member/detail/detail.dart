// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
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
        titleText: '회원 상세',
        actionsWidget: <Widget>[
          IconButton(
            icon: const SizedBox(width: 20, child: Icon(Icons.delete_outline)),
            onPressed: () => onMemberDeleteIconPressed(context),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TitleWithDescription(
                title: '${member.name}님',
                description: '${member.age}세 · ${member.gender}',
              ),
            ),
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

  onMemberDeleteIconPressed(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '회원 매칭 취소',
        content:
            '회원 매칭을 취소하시면\n\n - 해당 회원의 예약 수업 정보 모두 삭제\n - 회원 리스트에서 해당 회원 조회 불가\n\n처리됩니다.',
        positiveText: '매칭 취소하기',
        onPositivePressed: () => Navigator.of(context).pop(),
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
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => {_vm.fetchMemberInfo()});

    return const SizedBox.shrink();
  }
}
