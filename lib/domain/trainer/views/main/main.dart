import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar_with_logo.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/components/empty_patch.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/calendar/calendar.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/main_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/main/todo_list/list_item.dart';

class TrainerMainView extends StatefulWidget {
  const TrainerMainView({Key? key}) : super(key: key);

  @override
  State<TrainerMainView> createState() => _TrainerMainViewState();
}

class _TrainerMainViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      final memberName = vm.memberName;
      final targetDate = vm.targetDate.value;

      return Scaffold(
        appBar: const CustomAppBarWithLogo(titleText: '메인'),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: TitleWithDescription(
                  title: '반갑습니다, $memberName 코치님',
                  description: targetDate.toKoreanFormat,
                ),
              ),
              const Calendar(),
              const SizedBox(height: 10),
              const CustomDivider(),
              _buildListView(),
            ],
          ),
        ),
      );
    });
  }

  _buildListView() {
    return Obx(() {
      final list = vm.todoItemModels;

      return Expanded(
          child: list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (ctx, index) =>
                      TrainerMainTodoItem(model: list[index]))
              : const EmptyDataPatch());
    });
  }
}

class _Detail extends MyGetXState<TrainerMainView, MainViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

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
      Future.wait([vm.fetchMyInfo(), vm.fetchData(vm.targetDateString)]);
    });

    return widget;
  }

  @override
  MainViewModel createViewModel() => MainViewModel();
}
