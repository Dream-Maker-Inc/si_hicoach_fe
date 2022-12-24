import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/components/exercise.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/components/memo.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/components/time.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/study_detail_vm.dart';
import 'package:si_hicoach_fe/ui/common/study/update/study_update.dart';
import 'package:si_hicoach_fe/ui/trainer/members/detail/detail.dart';

class StudyDetailView extends StatefulWidget {
  final int studyId;
  final bool isMemberDetailEnabled;
  final bool readonly;

  const StudyDetailView({
    super.key,
    required this.studyId,
    this.isMemberDetailEnabled = true,
    this.readonly = false,
  });

  @override
  State<StudyDetailView> createState() => _StudyDetailViewState();
}

class _StudyDetailViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: <Widget>[
              _buildMemberInfoSection(),
              const SizedBox(height: widePadding),
              _buildDetailTimeSection(),
              const SizedBox(height: widePadding),
              _buildExercisesSection(),
              const SizedBox(height: widePadding),
              _buildDetailMemo(),
            ],
          ),
        ),
      ),
    );
  }

  _buildDetailMemo() {
    return Obx(() {
      return DetailMemo(memo: vm.memo);
    });
  }

  _buildExercisesSection() {
    return Obx(() {
      final items = vm.exerciseItemModels
          .map(
            (it) => DetailExercise(
              title: it.name,
              weight: it.weight,
              count: it.count,
              set: it.sets,
            ),
          )
          .toList();

      return Column(
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
          ...items,
        ],
      );
    });
  }

  _buildDetailTimeSection() {
    return Obx(() {
      return DetailTime(
        startedTime: vm.startedTimeString,
        endedTime: vm.endedTimeSting,
      );
    });
  }

  _buildMemberInfoSection() {
    return Obx(() {
      final memberName = vm.memberName;
      final startedDate = vm.startedDateString;

      return Column(children: [
        Row(
          children: <Widget>[
            Text(
              '$memberName님',
              style: titleLarge.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
            _buildMemberDetailIconButton()
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            startedDate,
            style: bodySmall.copyWith(
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ]);
    });
  }

  _buildAppbar() {
    final actionIcons = widget.readonly
        ? <Widget>[]
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

    return CustomAppBarArrowBack(
      titleText: '운동 일지 상세',
      actionsWidget: actionIcons,
    );
  }

  _buildMemberDetailIconButton() {
    if (widget.isMemberDetailEnabled == false) return Container();

    return IconButton(
      icon: const Icon(Icons.open_in_new_rounded),
      onPressed: handleMemberDetailButtonPressed,
      color: Colors.grey,
    );
  }
}

class _Detail extends MyGetXState<StudyDetailView, StudyDetailViewModel> {
  handleEditButtonPressed() {
    Get.to(StudyUpdateView(studyId: vm.studyId))?.then(
      (value) => vm.refetch(),
    );
  }

  handleDeleteButtonPressed() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '일지 삭제',
        content: '운동 일지를 삭제하시겠습니까?',
        positiveText: '삭제',
        onPositivePressed: () => vm.deleteStudy(vm.studyId),
        negativeText: '취소',
        onNegativePressed: () => Get.back(),
      ),
    );
  }

  handleMemberDetailButtonPressed() {
    final memberId = vm.member?.id ?? 0;

    Get.to(DetailView(memberId: memberId));
  }

  @override
  void initState() {
    super.initState();

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

      showMyHttpErrorDialog(e.toString()).then((_) => Get.back());
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
