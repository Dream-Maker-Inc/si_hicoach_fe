import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/trainer/members/add/matching_create/matching_create_vm.dart';

class MatchingCreateView extends StatefulWidget {
  final int memberId;

  const MatchingCreateView({super.key, required this.memberId});

  @override
  State<MatchingCreateView> createState() => _MatchingCreateViewState();
}

class _MatchingCreateViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: widePadding),
              _buildExerciseGoalsSection(),
              const SizedBox(height: widePadding),
              _buildMemoSection(),
              const SizedBox(height: widePadding),
              _buildTotalTicketCountSection(),
              const SizedBox(height: widePadding),
              _buildFinishedTicketCountSection(),
              const SizedBox(height: widePadding),
              _buildSubmitButton(),
            ],
          ),
        ),
      )),
    );
  }

  _buildSubmitButton() {
    return Obx(() {
      final submit = vm.submitButtonDisabled ? null : handleSubmit;

      return CustomElevatedButton(onPressed: submit, text: '완료');
    });
  }

  _buildFinishedTicketCountSection() {
    return Obx(() {
      final finishedTicketCount = vm.finishedTicketCount.value;

      return Column(
        children: [
          const TitleWithDescription(
            title: '완료 수강 횟수 (선택)',
            description:
                '회원을 등록하기 전 이미 진행한 수업이 있다면, 완료 수업 횟수를 입력해 주세요.\n\n입력 시 완료 수강 횟수는 총 횟수에서 자동으로 차감됩니다.',
          ),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: '완료 횟수',
            suffixText: '회',
            maxLength: 3,
            value: finishedTicketCount.toString(),
            onChanged: handleFinishedCountChange,
          ),
        ],
      );
    });
  }

  _buildTotalTicketCountSection() {
    return Obx(() {
      final totalTicketCount = vm.totalTicketCount.value;

      return Column(
        children: [
          const TitleWithDescription(
            title: '총 수강 횟수 (필수)',
            description:
                '앱으로 관리하실 회원의 수강권의 총 횟수를 입력해 주세요.\n이 횟수를 기반으로 잔여 횟수가 차감됩니다.\n\n총 횟수는 언제든지 추가할 수 있어요.',
          ),
          const SizedBox(height: smallPadding),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: '총 횟수',
            suffixText: '회',
            maxLength: 3,
            value: totalTicketCount.toString(),
            onChanged: handleTotalCountChange,
          ),
        ],
      );
    });
  }

  _buildMemoSection() {
    return Obx(() {
      final memberName = vm.memberName;
      final memo = vm.memo.value;

      return Column(
        children: [
          TitleWithDescription(
            title: '메모 (선택)',
            description: '$memberName 회원님에 대해 자유롭게 기록하세요.',
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              maxLength: 1000,
              minLines: 5,
              maxLines: 100,
              decoration: InputDecoration(
                hintText: '메모를 입력해주세요.',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 4,
                  ),
                ),
                counterText: '',
              ),
              initialValue: memo,
              onChanged: handleMemoChange,
            ),
          ),
        ],
      );
    });
  }

  _buildExerciseGoalsSection() {
    return Obx(() {
      final customChipProps = vm.customChipProps;
      final memberName = vm.memberName;

      return Column(
        children: [
          TitleWithDescription(
            title: '운동 목표 (선택)',
            description: '$memberName 회원님의 운동 목표를 복수 선택해 주세요.',
          ),
          Wrap(
            children: List.from(customChipProps.map(
              (it) => CustomChip(
                label: it.label,
                isChecked: it.isChecked,
                onPressed: () => handleChipClick(it.id),
              ),
            )),
          ),
        ],
      );
    });
  }

  _buildHeader() {
    return Obx(() {
      final memberName = vm.memberName;

      return TitleWithDescription(
        title: '추가 정보 입력',
        description: "$memberName 회원님에 대한 추가 정보를 입력해 주세요.",
      );
    });
  }
}

class _Detail extends MyGetXState<MatchingCreateView, MatchingCreateViewModel> {
  int get memberId => widget.memberId;

  handleChipClick(int id) {
    vm.toggleGoalChecked(id);
  }

  handleMemoChange(String v) {
    vm.memo.value = v;
  }

  handleTotalCountChange(String totalCount) {
    vm.totalTicketCount.value = int.tryParse(totalCount) ?? 0;
  }

  handleFinishedCountChange(String finishedCount) {
    vm.finishedTicketCount.value = int.tryParse(finishedCount) ?? 0;
  }

  handleSubmit() {
    vm.createMatching(memberId);
  }

  @override
  void initState() {
    super.initState();

    vm.createMatchingSuccess.listen((b) {
      if (!b) return;

      showMySimpleDialog(
          context: context,
          title: '회원 추가 성공',
          content: "회원을 추가 했습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        vm.fetchMember(memberId),
        vm.fetchGoals(),
      ]);
    });
    return widget;
  }

  @override
  MatchingCreateViewModel createViewModel() => MatchingCreateViewModel();
}
