import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/simple_time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/time/time.dart';
import 'package:si_hicoach_fe/domain/study/common/components/memo.dart';
import 'package:si_hicoach_fe/domain/study/create/study_create_vm.dart';

class StudyProps {
  final String name;
  final int weight;
  final int count;
  final int set;

  StudyProps(this.name, this.weight, this.count, this.set);
}

class StudyEditView extends StatefulWidget {
  const StudyEditView({Key? key}) : super(key: key);

  @override
  State<StudyEditView> createState() => _StudyEditViewState();
}

class _StudyEditViewState extends _Detail {
  handleSubmitButtonPressed() {
    print('submit');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 작성',
        actionsWidget: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: handleSubmitButtonPressed,
          )
        ],
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

    vm.apiError.listen((e) {
      if (e == null) return;

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
  StudyCreateViewModel createViewModel() => StudyCreateViewModel();
}
