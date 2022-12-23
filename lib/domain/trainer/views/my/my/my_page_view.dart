import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/my/menu.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/my/mypage_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/my/summary.dart';

class TrainerMyPageView extends StatefulWidget {
  const TrainerMyPageView({Key? key}) : super(key: key);

  @override
  State<TrainerMyPageView> createState() => _TrainerMyPageViewState();
}

class _TrainerMyPageViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '마이페이지'),
      body: SafeArea(
        child: _buildContent(),
      ),
    );
  }

  _buildContent() {
    return GetBuilder<MyPageViewModel>(builder: (builder) {
      final memberName = vm.memberName;
      final companyName = vm.companyName;
      final lastMonthStudyCount = vm.lastMonthStudyCount;
      final thisMonthAtUntilToday = vm.thisMonthAtUntilToday;

      return SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            TrainerMypageSummaryView(
              name: memberName,
              companyName: companyName,
              currentStudy: thisMonthAtUntilToday,
              pastStudy: lastMonthStudyCount,
            ),
            const MypageMenuView(),
          ],
        ),
      );
    });
  }
}

class _Detail extends MyGetXState<TrainerMyPageView, MyPageViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          confirmText: "뒤로가기",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMyPageData()]);
    });

    return widget;
  }

  @override
  MyPageViewModel createViewModel() => MyPageViewModel();
}
