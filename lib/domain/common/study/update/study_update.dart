import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form.dart';
import 'package:si_hicoach_fe/domain/common/study/update/study_update_vm.dart';

class StudyUpdateView extends StatefulWidget {
  final int studyId;

  const StudyUpdateView({super.key, required this.studyId});

  @override
  State<StudyUpdateView> createState() => _StudyUpdateViewState();
}

class _StudyUpdateViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StudyForm(
      vm: vm,
      formTitle: "운동 일지 수정",
    );
  }
}

class _Detail extends MyGetXState<StudyUpdateView, StudyUpdateViewModel> {
  @override
  void initState() {
    super.initState();

    vm.studyId = widget.studyId;

    vm.updateStudySuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showMySimpleDialog(
          context: context,
          title: '운동일지 수정 성공',
          content: "운동일지가 수정 되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();

            vm.fetchStudy(vm.studyId);
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is ExistStudyException) {
        return showMySimpleDialog(
            context: context,
            title: '수정 실패',
            content: "이미 해당 시간에 예약된 스터디가 존재합니다.",
            onConfirm: () {
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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => vm.fetchStudy(vm.studyId));

    return widget;
  }

  @override
  StudyUpdateViewModel createViewModel() =>
      StudyUpdateViewModel(studyId: widget.studyId);
}
