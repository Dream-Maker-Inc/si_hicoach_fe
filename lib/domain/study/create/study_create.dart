import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/memo.dart';
import 'package:si_hicoach_fe/domain/study/create/study_create_vm.dart';

class StudyEditView extends StatefulWidget {
  final int matchingId;
  final int latestStudyRound;
  final int totalStudyCount;

  const StudyEditView(
      {super.key,
      required this.matchingId,
      required this.latestStudyRound,
      required this.totalStudyCount});

  @override
  State<StudyEditView> createState() => _StudyEditViewState();
}

class _StudyEditViewState extends _Detail {
  handleSubmitButtonPressed() {
    vm.createStudy();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 작성',
        actionsWidget: <Widget>[_buildSubmitButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                _buildTimeSection(),
                const SizedBox(height: widePadding),
                _buildEditExerciseSection(),
                const SizedBox(height: defaultPadding),
                const CustomDivider(),
                const SizedBox(height: widePadding),
                _buildEditMemoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSubmitButton() {
    return Obx(() {
      final disabled = vm.submitButtonDisabled;
      final onClick = !disabled ? handleSubmitButtonPressed : null;

      return IconButton(
        icon: const Icon(Icons.check),
        onPressed: onClick,
      );
    });
  }

  _buildTimeSection() {
    handleTimeSelect(SimpleTime time) {
      vm.studyTime.value = time;
    }

    return Obx(() {
      final model = vm.editTimeModel.value;

      return EditTime(
        model: model,
        onTimeSelect: handleTimeSelect,
      );
    });
  }

  _buildEditExerciseSection() {
    final handleAddExercise = vm.addExerciseItem;

    return Obx(() {
      final models = vm.exerciseItemModels.toList();
      final List<StudyEditExerciseItemProps> itemProps = models
          .map((it) => StudyEditExerciseItemProps(
                model: it,
                onWeightChange: (weight) {
                  vm.handleExerciseItemStateChange(it.id, weight: weight);
                },
                onCountChange: (count) {
                  vm.handleExerciseItemStateChange(it.id, count: count);
                },
                onSetsChange: (sets) {
                  vm.handleExerciseItemStateChange(it.id, sets: sets);
                },
                onDelete: vm.handleExerciseItemDelete,
              ))
          .toList();

      return EditExercise(
        itemProps: itemProps,
        onAddExercise: handleAddExercise,
      );
    });
  }

  _buildEditMemoSection() {
    handleMemoChange(String v) {
      vm.memo.value = v;
    }

    return Obx(() {
      final memo = vm.memo.value;

      return EditMemo(
        memo: memo,
        onChange: handleMemoChange,
      );
    });
  }
}

class _Detail extends MyGetXState<StudyEditView, StudyCreateViewModel> {
  @override
  void initState() {
    super.initState();

    vm.createStudySuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      Get.defaultDialog(
          title: '운동일지 등록 성공',
          content: const Text("운동일지가 등록 되었습니다."),
          textConfirm: "확인",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is ExistStudyException) {
        Get.snackbar('등록 실패', "이미 해당 시간에 등록된 스터디가 있어요",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      Get.defaultDialog(
          title: 'Error',
          content: Text(e.toString()),
          textConfirm: "뒤로가기",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  StudyCreateViewModel createViewModel() => StudyCreateViewModel(
      matchingId: widget.matchingId,
      latestStudyRound: widget.latestStudyRound,
      totalStudyCount: widget.latestStudyRound);
}
