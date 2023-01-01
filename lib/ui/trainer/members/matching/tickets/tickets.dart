// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert_widget.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/tickets/add_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/tickets/remove_dialog.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/tickets/tickets_vm.dart';

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
      builder: (_) => CustomAlertDialogWidget(
        title: 'PT 횟수 추가',
        content: EditTicketDialog(),
        positiveText: '추가하기',
        onPositivePressed: () => vm.increaseTickets(
          vm.matchingId,
          vm.countOfAdd.value,
        ),
        negativeText: '취소',
        onNegativePressed: () => Get.back(),
      ),
    );
  }

  handleRemoveButtonPressed() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) => CustomAlertDialogWidget(
        title: 'PT 횟수 차감',
        content: RemoveTicketDialog(),
        positiveText: '차감하기',
        onPositivePressed: () => vm.decreaseTickets(
          vm.matchingId,
          vm.countOfMinus.value,
        ),
        negativeText: '취소',
        onNegativePressed: () => Get.back(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '수강권 관리'),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRemainingTicketCount(),
                  Container(
                    margin: const EdgeInsets.all(smallPadding),
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        _buildMinusButton(),
                        Container(
                          width: 1,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        _buildAddButton(),
                      ],
                    ),
                  ),
                ],
              ),
              _buildBottom()
            ],
          )),
    );
  }

  _buildBottom() {
    return Obx(() {
      final finishedStudyCount = vm.totalStudyCount;
      final totalTicketCount = vm.totalTicketCount;

      return Column(
        children: [
          ListTile(
            title: const Text('PT 완료 횟수'),
            trailing: Text('$finishedStudyCount회'),
          ),
          ListTile(
            title: const Text('PT 총 횟수'),
            trailing: Text('$totalTicketCount회'),
          ),
        ],
      );
    });
  }

  _buildRemainingTicketCount() {
    return Obx(() {
      final remainingTicketCount = vm.remainingTicketCount;

      return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            'PT 잔여 횟수 : $remainingTicketCount회',
            style: bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      );
    });
  }

  _buildMinusButton() {
    return Obx(() {
      final isMinusable = vm.isMinusable;

      final onClick = isMinusable ? handleRemoveButtonPressed : null;
      final color =
          isMinusable ? Colors.red : Colors.grey.shade400.withOpacity(0.5);

      return IconButton(
        onPressed: onClick,
        icon: Icon(
          Icons.remove_rounded,
          color: color,
        ),
      );
    });
  }

  _buildAddButton() {
    return IconButton(
      onPressed: handleAddButtonPressed,
      icon: Icon(
        Icons.add_rounded,
        color: primaryColor,
      ),
    );
  }
}

class _Detail extends MyGetXState<TicketsView, TicketsViewModel> {
  @override
  void initState() {
    super.initState();

    vm.increaseTicketsSuccess.listen((b) {
      if (!b) return;

      showMySimpleDialog(
          context: context,
          title: "요청 처리",
          content: "회원의 수강권 횟수를 추가했습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.decreaseTicketsSuccess.listen((b) {
      if (!b) return;

      showMySimpleDialog(
          context: context,
          title: "요청 처리",
          content: "회원의 수강권 횟수를 차감했습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchTicketsInfo(vm.matchingId);
    });

    return widget;
  }

  @override
  TicketsViewModel createViewModel() =>
      TicketsViewModel(matchingId: widget.matchingId);
}
