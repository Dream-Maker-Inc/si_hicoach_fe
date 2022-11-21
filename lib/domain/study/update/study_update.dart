import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/study/common/templates/study_form.dart';
import 'package:si_hicoach_fe/domain/study/update/study_update_vm.dart';

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

      Get.defaultDialog(
          title: '운동일지 수정 성공',
          content: const Text("운동일지가 수정 되었습니다."),
          textConfirm: "확인",
          onConfirm: () {
            Get.back();
            Get.back();

            vm.fetchStudy(vm.studyId);
          });
    });

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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => vm.fetchStudy(vm.studyId));

    return widget;
  }

  @override
  StudyUpdateViewModel createViewModel() =>
      StudyUpdateViewModel(studyId: widget.studyId);
}
