import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/ui/common/study/common/components/exercise.dart';
import 'package:si_hicoach_fe/ui/common/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/ui/common/study/common/components/time/time.dart';
import 'package:si_hicoach_fe/ui/common/study/common/components/memo.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form_vm.dart';
import 'package:si_hicoach_fe/infrastructure/exercises/exercise_item/dto/get_exercise_items_response.dart';

class StudyForm extends StatefulWidget {
  final String formTitle;
  final StudyFormViewModel vm;

  const StudyForm({
    super.key,
    required this.vm,
    this.formTitle = "운동 일지 작성",
  });

  @override
  State<StudyForm> createState() => _StudyFormState();
}

class _StudyFormState extends State<StudyForm> {
  StudyFormViewModel get vm => widget.vm;

  handleMemoChange(String v) {
    vm.memo.value = v;
  }

  handleAddExercise(ExerciseItem exercise) {
    vm.addExerciseItem(exercise);
  }

  handleTimeSelect(int hour) {
    vm.setStudyTime(hour);
  }

  handleSubmitButtonPressed() {
    vm.submit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: widget.formTitle,
        actionsWidget: [_buildSubmitButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
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

  // 제출 버튼
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

  // 스터디 시간 설정 섹션
  _buildTimeSection() {
    return Obx(() {
      final model = vm.editTimeModel.value;

      return EditTime(
        model: model,
        onTimeSelect: handleTimeSelect,
      );
    });
  }

  // 내 운동 목록 설정 섹션
  _buildEditExerciseSection() {
    return Obx(() {
      final models = vm.exerciseItemModels.toList();
      final List<StudyEditExerciseItemProps> itemProps = models
          .map(
            (it) => StudyEditExerciseItemProps(
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
            ),
          )
          .toList();

      return EditExercise(
        itemProps: itemProps,
        onAddExercise: handleAddExercise,
      );
    });
  }

  // 메모 섹션
  _buildEditMemoSection() {
    return Obx(() {
      final memo = vm.memo.value;

      if (memo == null) return Container();

      return EditMemo(
        memo: memo,
        onChange: handleMemoChange,
      );
    });
  }
}
