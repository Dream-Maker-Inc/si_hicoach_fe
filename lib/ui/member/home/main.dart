import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/member/home/main_vm.dart';
import 'package:si_hicoach_fe/ui/member/home/sections/tabs.dart';

class MemberMainView extends StatefulWidget {
  const MemberMainView({Key? key}) : super(key: key);

  @override
  State<MemberMainView> createState() => _MemberMainViewState();
}

class _MemberMainViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      return Scaffold(
        appBar: CustomAppBarWithLogo(titleText: '${vm.memberName}님'),
        body: const SizedBox(
          width: double.infinity,
          child: MemberMainTabs(),
        ),
      );
    });
  }
}

class _Detail extends MyGetXState<MemberMainView, MemberMainViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is UnauthorizedException) {
        showMySimpleDialog(
            context: context,
            title: "인증 실패",
            content: "비정상적인 인증 요청입니다.",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }

      showMyHttpErrorDialog(e.toString()).then((_) => Get.back());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.wait([
        vm.fetchMyInfo(),
      ]),
    );

    return widget;
  }

  @override
  MemberMainViewModel createViewModel() => MemberMainViewModel();
}
