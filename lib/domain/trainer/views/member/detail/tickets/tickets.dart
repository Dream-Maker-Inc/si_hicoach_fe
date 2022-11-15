// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert_widget.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/add_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/remove_dialog.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tickets/tickets_vm.dart';

class TicketsView extends StatefulWidget {
  int matchingId;

  TicketsView({super.key, required this.matchingId});

  @override
  State<TicketsView> createState() => _TicketsViewState();
}

class _TicketsViewState extends _Detail {
  handleAddButtonPressed() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialogWidget(
        title: 'PT 횟수 추가',
        content: EditTicketDialog(),
        positiveText: '추가하기',
        onPositivePressed: () => vm.increaseTickets(),
        negativeText: '취소',
        onNegativePressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    handleRemoveButtonPressed() {
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CustomAlertDialogWidget(
          title: 'PT 횟수 차감',
          content: RemoveTicketDialog(),
          positiveText: '차감하기',
          onPositivePressed: () => vm.decreaseTickets(),
          negativeText: '취소',
          onNegativePressed: () => Navigator.pop(context),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '수강권 관리'),
      body: SizedBox(
        width: double.infinity,
        child: Obx(() {
          final finishedStudyCount = vm.finishedStudyCount.value;
          final remainingTicketCount = vm.remainingTicketCount.value;
          final totalTicketCount = vm.totalTicketCount;

          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        'PT 잔여 횟수 : $remainingTicketCount회',
                        style: bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(smallPadding),
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: handleRemoveButtonPressed,
                          icon: const Icon(
                            Icons.remove_rounded,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        IconButton(
                          onPressed: handleAddButtonPressed,
                          icon: Icon(
                            Icons.add_rounded,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListTile(
                  title: const Text('PT 완료 횟수'),
                  trailing: Text('$finishedStudyCount회')),
              ListTile(
                  title: const Text('PT 총 횟수'),
                  trailing: Text('$totalTicketCount회')),
            ],
          );
        }),
      ),
    );
  }
}

class _Detail extends MyGetXState<TicketsView, TicketsViewModel> {
  @override
  void initState() {
    super.initState();

    vm.matchingId = widget.matchingId;

    vm.increaseTicketsSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showSimpleDialog(
          context: context,
          title: "요청 처리",
          content: "회원의 수강권 횟수를 추가했습니다.",
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });

      vm.increaseTicketsSuccess.value = false;
    });

    vm.decreaseTicketsSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showSimpleDialog(
          context: context,
          title: "요청 처리",
          content: "회원의 수강권 횟수를 차감했습니다.",
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });

      vm.decreaseTicketsSuccess.value = false;
    });

    vm.apiError.listen((e) {
      showSimpleDialog(context: context, title: "에러", content: e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => {vm.fetchTicketsInfo()});

    return widget;
  }

  @override
  TicketsViewModel createViewModel() => TicketsViewModel();
}
