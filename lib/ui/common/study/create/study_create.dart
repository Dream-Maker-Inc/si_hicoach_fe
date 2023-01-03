// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/common/study/common/templates/study_form.dart';
import 'package:si_hicoach_fe/ui/common/study/create/study_create_vm.dart';

class StudyCreateView extends StatefulWidget {
  final int matchingId;
  final int nextStudyRound;
  final int totalTicketCount;
  DateTime? targetDateTime;

  StudyCreateView({
    super.key,
    required this.matchingId,
    required this.nextStudyRound,
    required this.totalTicketCount,
    this.targetDateTime,
  });

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
  _handleIfTicketNotUseable() {
    if (!vm.isTicketUseable()) {
      showMySimpleDialog(
          context: context,
          title: '수강권 부족',
          content: "회원의 잔여 수강권이 부족합니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    }
  }

  // 뷰모델 초기값 설정
  _setInitialViewModelData() {
    final targetDate = widget.targetDateTime ?? DateTime.now();

    vm.targetDate.value = targetDate;
    vm.setStudyTime(targetDate.hour);
    vm.matchingId = widget.matchingId;
    vm.nextStudyRound.value = widget.nextStudyRound;
    vm.totalStudyCount.value = widget.totalTicketCount;
  }

  @override
  void initState() {
    super.initState();

    _setInitialViewModelData();

    vm.studyCreateSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showMySimpleDialog(
          context: context,
          title: '운동일지 등록 성공',
          content: "운동일지가 등록 되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is ExistStudyException) {
        Get.snackbar('등록 실패', "이미 해당 시간에 등록된 일정이 있어요",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      showMyHttpErrorDialog(e.toString()).then((_) => Get.back());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        vm.fetchTicketsInfo(widget.matchingId),
      ]).then((_) {
        _handleIfTicketNotUseable();
      });
    });

    return widget;
  }

  @override
  StudyCreateViewModel createViewModel() =>
      StudyCreateViewModel(matchingId: widget.matchingId);
}
