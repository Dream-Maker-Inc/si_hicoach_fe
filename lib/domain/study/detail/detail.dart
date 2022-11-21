import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/study/detail/components/exercise.dart';
import 'package:si_hicoach_fe/domain/study/detail/components/memo.dart';
import 'package:si_hicoach_fe/domain/study/detail/components/time.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/study/detail/study_detail_vm.dart';
import 'package:si_hicoach_fe/domain/study/update/study_update.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail.dart';

class StudyDetailView extends StatefulWidget {
  final int studyId;
  final bool isMemberDetailEnabled;

  const StudyDetailView({
    super.key,
    required this.studyId,
    this.isMemberDetailEnabled = true,
  });

  @override
  State<StudyDetailView> createState() => _StudyDetailViewState();
}

class _StudyDetailViewState extends _Detail {
  handleEditButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StudyUpdateView(studyId: vm.studyId),
      ),
    );
  }

  handleDeleteButtonPressed() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '일지 삭제',
        content: '운동 일지를 삭제하시겠습니까?',
        positiveText: '삭제',
        onPositivePressed: () => Navigator.of(context).pop(),
        negativeText: '취소',
        onNegativePressed: () => Navigator.pop(context, true),
      ),
    );
  }

  handleMemberDetailButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailView(memberId: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      return Scaffold(
        appBar: CustomAppBarArrowBack(
          titleText: '운동 일지 상세',
          actionsWidget: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: handleEditButtonPressed,
            ),
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: handleDeleteButtonPressed,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '${vm.memberName}님',
                      style: titleLarge.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    if (widget.isMemberDetailEnabled == true) ...[
                      IconButton(
                        icon: const Icon(Icons.open_in_new_rounded),
                        onPressed: handleMemberDetailButtonPressed,
                        color: Colors.grey,
                      ),
                    ],
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    vm.startedDateString,
                    style: bodySmall.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                const SizedBox(height: widePadding),
                DetailTime(
                  startedTime: vm.startedTimeString,
                  endedTime: vm.endedTimeSting,
                ),
                const SizedBox(height: widePadding),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '운동 일지',
                        style: titleLarge.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    ..._buildExerciseItems(vm.exerciseItemModels),
                  ],
                ),
                const SizedBox(height: widePadding),
                DetailMemo(memo: vm.memo),
              ],
            ),
          ),
        ),
      );
    });
  }

  _buildExerciseItems(List<ExerciseItemModel> models) {
    return vm.exerciseItemModels.map((it) => _buildExerciseItem(it)).toList();
  }

  Widget _buildExerciseItem(ExerciseItemModel model) {
    return Column(
      children: [
        DetailExercise(
          title: model.name,
          weight: model.weight,
          count: model.count,
          set: model.sets,
        ),
      ],
    );
  }
}

class _Detail extends MyGetXState<StudyDetailView, StudyDetailViewModel> {
  @override
  void initState() {
    super.initState();

    vm.studyId = widget.studyId;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchStudy(widget.studyId)]);
    });

    return widget;
  }

  @override
  StudyDetailViewModel createViewModel() =>
      StudyDetailViewModel(studyId: widget.studyId);
}
