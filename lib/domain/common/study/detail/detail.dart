import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login.dart';
import 'package:si_hicoach_fe/domain/common/study/common/components/exercise_item.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/components/exercise.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/components/memo.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/components/time.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/study_detail_vm.dart';
import 'package:si_hicoach_fe/domain/common/study/update/study_update.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail.dart';

class StudyDetailView extends StatefulWidget {
  final int studyId;
  final bool isMemberDetailEnabled;
  final bool readonly;

  const StudyDetailView(
      {super.key,
      required this.studyId,
      this.isMemberDetailEnabled = true,
      this.readonly = false});

  @override
  State<StudyDetailView> createState() => _StudyDetailViewState();
}

class _StudyDetailViewState extends _Detail {
  handleEditButtonPressed() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => StudyUpdateView(studyId: vm.studyId),
          ),
        )
        .then((value) => vm.fetchStudy(vm.studyId));
  }

  handleDeleteButtonPressed() {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '일지 삭제',
        content: '운동 일지를 삭제하시겠습니까?',
        positiveText: '삭제',
        onPositivePressed: () => vm.deleteStudy(vm.studyId),
        negativeText: '취소',
        onNegativePressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  handleMemberDetailButtonPressed() {
    final memberId = vm.member?.id ?? 0;
    final matchingId = vm.matchingId;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailView(memberId: memberId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      final actionIcons = widget.readonly
          ? null
          : <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: handleEditButtonPressed,
              ),
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: handleDeleteButtonPressed,
              ),
            ];

      return Scaffold(
        appBar: CustomAppBarArrowBack(
          titleText: '운동 일지 상세',
          actionsWidget: actionIcons,
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

    vm.deleteStudyResponse.listen((isSuccess) {
      if (isSuccess == false) return;

      showMySimpleDialog(
          context: context,
          title: '운동일지 삭제 성공',
          content: "운동일지가 삭제 되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is UnauthorizedException) {
        return showMySimpleDialog(
            context: context,
            title: '로그인 필요',
            content: "로그인 후 확인 할 수 있어요.",
            onConfirm: () {
              Get.offAll(const LoginView());
            });
      }

      if (e is NotExistException) {
        return showMySimpleDialog(
            context: context,
            title: '스터디 정보 없음',
            content: "스터디 정보가 없습니다.",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          confirmText: "뒤로가기",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });
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
