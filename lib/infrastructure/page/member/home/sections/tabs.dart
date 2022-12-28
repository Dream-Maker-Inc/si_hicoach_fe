import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/home/main_vm.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/home/sections/panels/latest_study_info/latest_study_info_view.dart';
import 'package:si_hicoach_fe/infrastructure/page/member/home/sections/panels/study_list/study_list_view.dart';

class MemberMainTabs extends StatefulWidget {
  const MemberMainTabs({Key? key}) : super(key: key);

  @override
  State<MemberMainTabs> createState() => _MemberMainTabsState();
}

class _MemberMainTabsState extends State<MemberMainTabs>
    with SingleTickerProviderStateMixin {
  MemberMainViewModel vm = Get.find<MemberMainViewModel>();

  List<String> tabTitles = ['직전 수업', '오늘 수업', '예정 수업'];
  late final tabController =
      TabController(length: tabTitles.length, vsync: this);

  @override
  void initState() {
    super.initState();

    tabController.addListener(() {
      vm.tabIndex.value = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          controller: tabController,
          tabs: tabTitles
              .map(
                (it) => Tab(text: it, height: 54),
              )
              .toList(),
          labelColor: primaryColor,
          unselectedLabelColor: Colors.black,
          labelStyle: labelLarge,
          unselectedLabelStyle: labelLarge.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: CustomDivider(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const MainLatestStudyInfoView(),
          _buildTodayStudies(),
          _buildNextStudies(),
        ],
      ),
    );
  }

  _buildNextStudies() {
    return Obx(() {
      return MainStudyListView(
        models: vm.nextStudyItemModels,
      );
    });
  }

  _buildTodayStudies() {
    return Obx(() {
      return MainStudyListView(
        models: vm.todayStudyItemModels,
      );
    });
  }
}
