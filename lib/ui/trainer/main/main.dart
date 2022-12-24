import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/trainer/main/calendar/calendar.dart';
import 'package:si_hicoach_fe/ui/trainer/main/main_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/main/todo_list/list_item.dart';

class TrainerMainView extends StatefulWidget {
  const TrainerMainView({Key? key}) : super(key: key);

  @override
  State<TrainerMainView> createState() => _TrainerMainViewState();
}

class _TrainerMainViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarWithLogo(titleText: '메인'),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const Calendar(),
            const SizedBox(height: 10),
            const CustomDivider(),
            Expanded(child: _buildListView()),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Obx(() {
      final memberName = vm.memberName;
      final targetDate = DateTime.now();

      return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TitleWithDescription(
          title: '반갑습니다, $memberName 코치님',
          description: targetDate.toKoreanFormat,
        ),
      );
    });
  }

  _buildListView() {
    return Obx(() {
      final list = vm.todoItemModels;

      if (list.isEmpty) return const EmptyDataPatch();

      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, index) => TrainerMainTodoItem(model: list[index]),
      );
    });
  }
}

class _Detail extends MyGetXState<TrainerMainView, TrainerMainViewModel> {
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
      Future.wait([
        vm.fetchMyInfo(),
        vm.fetchData(vm.targetDateString),
      ]);
    });

    return widget;
  }

  @override
  TrainerMainViewModel createViewModel() => TrainerMainViewModel();
}
