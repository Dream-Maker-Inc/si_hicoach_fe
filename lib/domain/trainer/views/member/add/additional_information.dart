import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/additional_information_vm.dart';

class AddAdditionalInformation extends StatefulWidget {
  final int memberId;

  const AddAdditionalInformation({Key? key, required this.memberId})
      : super(key: key);

  @override
  State<AddAdditionalInformation> createState() =>
      _AddAdditionalInformationState();
}

class _AddAdditionalInformationState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
        child: Obx(() {
          final customChipProps = _vm.customChipProps;

          final memo = _vm.memo.value;
          final totalTicketCount = _vm.totalTicketCount.value;
          final finishedTicketCount = _vm.finishedTicketCount.value;

          final memberName = _vm.memberName;

          final submit = _vm.submitButtonDisabled ? null : handleSubmit;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TitleWithDescription(
                    title: '추가 정보 입력',
                    description: "$memberName 회원님에 대한 추가 정보를 입력해 주세요.",
                  ),
                  const SizedBox(height: widePadding),
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
                  const SizedBox(height: widePadding),
                  TitleWithDescription(
                    title: '메모 (선택)',
                    description: '$memberName 회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
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
                  const SizedBox(height: widePadding),
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
                  const SizedBox(height: widePadding),
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
                  const SizedBox(height: widePadding),
                  CustomElevatedButton(onPressed: submit, text: '완료'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _Detail extends State<AddAdditionalInformation> {
  late AdditionalInformationViewModel _vm;

  handleChipClick(int id) {
    _vm.handleGoalClick(id);
  }

  handleMemoChange(String v) {
    _vm.memo.value = v;
  }

  handleTotalCountChange(String totalCount) {
    _vm.totalTicketCount.value = int.tryParse(totalCount) ?? 0;
  }

  handleFinishedCountChange(String finishedCount) {
    _vm.finishedTicketCount.value = int.tryParse(finishedCount) ?? 0;
  }

  handleSubmit() {
    _vm.createMatching(widget.memberId);
  }

  @override
  void initState() {
    super.initState();

    Get.delete<AdditionalInformationViewModel>();
    _vm = Get.put(AdditionalInformationViewModel());

    _vm.createMatchingSuccess.listen((isSuccess) {
      if (!isSuccess) return;

      showMySimpleDialog(
          context: context,
          title: '회원 추가 성공',
          content: _vm.matchingSuccessMsg,
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          });

      _vm.createMatchingSuccess.value = false;
    });

    _vm.apiError.listen((e) {
      if (e == null) return;

      _vm.clear();

      showMySimpleDialog(
          context: context, title: 'Error', content: e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vm.fetchMember(widget.memberId);
      _vm.fetchGoals();
    });
    return const SizedBox.shrink();
  }
}
