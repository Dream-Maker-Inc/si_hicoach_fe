import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/member/my_page/main/sections/menu.dart';
import 'package:si_hicoach_fe/ui/member/my_page/main/my_page_vm.dart';
import 'package:si_hicoach_fe/ui/member/my_page/main/sections/summary.dart';

class MemberMypageView extends StatefulWidget {
  const MemberMypageView({Key? key}) : super(key: key);

  @override
  State<MemberMypageView> createState() => _MemberMypageViewState();
}

class _MemberMypageViewState
    extends MyGetXState<MemberMypageView, MemberMyPageViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
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
