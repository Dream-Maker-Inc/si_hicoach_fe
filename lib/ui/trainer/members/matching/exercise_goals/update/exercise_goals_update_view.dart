import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/trainer/members/matching/exercise_goals/update/exercise_goals_update_vm.dart';

class ExerciseGoalsUpdateView extends StatefulWidget {
  final int matchingId;

  const ExerciseGoalsUpdateView({super.key, required this.matchingId});

  @override
  State<ExerciseGoalsUpdateView> createState() =>
      _ExerciseGoalsUpdateViewState();
}

class _ExerciseGoalsUpdateViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 목표 수정',
        actionsWidget: [
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
          children: [
            const TitleWithDescription(
              title: '운동 목표를 선택해주세요.',
              description: '복수 선택이 가능합니다.',
            ),
            const SizedBox(height: defaultPadding),
            _buildChips()
          ],
        ),
      ),
    );
  }

  _buildChips() {
    return Obx(() {
      return Wrap(
        children: vm.customChipProps
            .map(
              (it) => CustomChip(
                label: it.label,
                isChecked: vm.getGoalChecked(it.id),
                onPressed: () => handleChipClick(it.id),
              ),
            )
            .toList(),
      );
    });
  }
}

class _Detail
    extends MyGetXState<ExerciseGoalsUpdateView, ExerciseGoalsUpdateViewModel> {
  handleChipClick(int id) {
    vm.toggleGoalChecked(id);
  }

  handleSubmit() {
    vm.handleSubmit();
  }

  @override
  void initState() {
    super.initState();

    vm.updateMatchingSuccess.listen((b) {
      if (!b) return;

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

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        vm.fetchGoals(),
        vm.fetchMatching(widget.matchingId),
      ]);
    });

    return widget;
  }

  @override
  ExerciseGoalsUpdateViewModel createViewModel() =>
      ExerciseGoalsUpdateViewModel();
}
