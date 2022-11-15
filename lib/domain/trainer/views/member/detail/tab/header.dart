import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import '../detail_vm.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  final MemberDetailViewModel _vm = Get.find<MemberDetailViewModel>();

  _handleTabChange(int index) {
    _vm.tabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const <Widget>[
        Tab(text: '회원 정보', height: 54),
        Tab(text: '운동 일지'),
      ],
      labelColor: primaryColor,
      unselectedLabelColor: Colors.black,
      labelStyle: labelLarge,
      unselectedLabelStyle: labelLarge.copyWith(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      onTap: _handleTabChange,
    );
  }
}
