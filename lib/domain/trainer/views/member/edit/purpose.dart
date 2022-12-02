import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/edit/purpose_vm.dart';

class PurposeEditView extends StatefulWidget {
  final int matchingId;

  const PurposeEditView({super.key, required this.matchingId});

  @override
  State<PurposeEditView> createState() => _PurposeEditViewState();
}

class _PurposeEditViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 목표 수정',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: handleSubmit,
            icon: Icon(
              Icons.check_rounded,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const TitleWithDescription(
              title: '운동 목표를 선택해주세요.',
              description: '복수 선택이 가능합니다.',
            ),
            const SizedBox(height: defaultPadding),
            Obx(() => _buildChips())
          ],
        ),
      ),
    );
  }

  _buildChips() {
    return Wrap(
      children: vm.customChipProps
          .map((it) => CustomChip(
                label: it.label,
                isChecked: it.isChecked,
                onPressed: () => handleChipClick(it.id),
              ))
          .toList(),
    );
  }
}

class _Detail extends MyGetXState<PurposeEditView, PurposeEditViewModel> {
  handleChipClick(int id) {
    vm.handleGoalClick(id);
  }

  handleSubmit() {
    vm.handleSubmit();
  }

  @override
  void initState() {
    super.initState();

    vm.updateMatchingSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showMySimpleDialog(
          context: context,
          title: '수정 성공',
          content: "운동 목표가 수정되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

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
      Future.wait([vm.fetchGoals(), vm.fetchMatching(widget.matchingId)]);
    });

    return const SizedBox.shrink();
  }

  @override
  PurposeEditViewModel createViewModel() => PurposeEditViewModel();
}
