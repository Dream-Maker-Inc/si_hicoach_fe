import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/mypage_vm.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/summary.dart';

class MypageView extends StatefulWidget {
  const MypageView({Key? key}) : super(key: key);

  @override
  State<MypageView> createState() => _MypageViewState();
}

class _MypageViewState extends MyGetXState<MypageView, MemberMyPageViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          onConfirm: () {
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMyPageData()]);
    });

    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '마이페이지'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SummaryView(),
              const MenuView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MemberMyPageViewModel createViewModel() => MemberMyPageViewModel();
}
