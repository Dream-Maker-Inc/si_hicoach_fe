import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/member/views/main/main_vm.dart';
import 'package:si_hicoach_fe/domain/member/views/main/tab.dart';

class MemberMainView extends StatefulWidget {
  const MemberMainView({Key? key}) : super(key: key);

  @override
  State<MemberMainView> createState() => _MemberMainViewState();
}

class _MemberMainViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithLogo(titleText: '이은석 회원님'),
      body: SizedBox(
        width: double.infinity,
        child: MemberMainTab(),
      ),
    );
  }
}

class _Detail extends MyGetXState<MemberMainView, MainPageViewModel> {
  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  MainPageViewModel createViewModel() => MainPageViewModel();
}
