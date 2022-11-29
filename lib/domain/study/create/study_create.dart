import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/study/common/templates/study_form.dart';
import 'package:si_hicoach_fe/domain/study/create/study_create_vm.dart';

class StudyCreateView extends StatefulWidget {
  final int matchingId;
  final int nextStudyRound;
  final int totalTicketCount;

  const StudyCreateView(
      {super.key,
      required this.matchingId,
      required this.nextStudyRound,
      required this.totalTicketCount});

  @override
  State<StudyCreateView> createState() => _StudyCreateViewState();
}

class _StudyCreateViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StudyForm(vm: vm);
  }
}

class _Detail extends MyGetXState<StudyCreateView, StudyCreateViewModel> {
  @override
  void initState() {
    super.initState();

    vm.matchingId = widget.matchingId;
    vm.nextStudyRound.value = widget.nextStudyRound;
    vm.totalStudyCount.value = widget.totalTicketCount;

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
  StudyCreateViewModel createViewModel() =>
      StudyCreateViewModel(matchingId: widget.matchingId);
}
