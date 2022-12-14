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
      appBar: const CustomAppBarArrowBack(titleText: 'νμ μΆκ°'),
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

      return CustomElevatedButton(onPressed: submit, text: 'μλ£');
    });
  }

  _buildFinishedTicketCountSection() {
    return Obx(() {
      final finishedTicketCount = vm.finishedTicketCount.value;

      return Column(
        children: [
          const TitleWithDescription(
            title: 'μλ£ μκ° νμ (μ ν)',
            description:
                'νμμ λ±λ‘νκΈ° μ  μ΄λ―Έ μ§νν μμμ΄ μλ€λ©΄, μλ£ μμ νμλ₯Ό μλ ₯ν΄ μ£ΌμΈμ.\n\nμλ ₯ μ μλ£ μκ° νμλ μ΄ νμμμ μλμΌλ‘ μ°¨κ°λ©λλ€.',
          ),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: 'μλ£ νμ',
            suffixText: 'ν',
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
            title: 'μ΄ μκ° νμ (νμ)',
            description:
                'μ±μΌλ‘ κ΄λ¦¬νμ€ νμμ μκ°κΆμ μ΄ νμλ₯Ό μλ ₯ν΄ μ£ΌμΈμ.\nμ΄ νμλ₯Ό κΈ°λ°μΌλ‘ μμ¬ νμκ° μ°¨κ°λ©λλ€.\n\nμ΄ νμλ μΈμ λ μ§ μΆκ°ν  μ μμ΄μ.',
          ),
          const SizedBox(height: smallPadding),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: 'μ΄ νμ',
            suffixText: 'ν',
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
            title: 'λ©λͺ¨ (μ ν)',
            description: '$memberName νμλμ λν΄ μμ λ‘­κ² κΈ°λ‘νμΈμ.',
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              maxLength: 1000,
              minLines: 5,
              maxLines: 100,
              decoration: InputDecoration(
                hintText: 'λ©λͺ¨λ₯Ό μλ ₯ν΄μ£ΌμΈμ.',
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
            title: 'μ΄λ λͺ©ν (μ ν)',
            description: '$memberName νμλμ μ΄λ λͺ©νλ₯Ό λ³΅μ μ νν΄ μ£ΌμΈμ.',
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
        title: 'μΆκ° μ λ³΄ μλ ₯',
        description: "$memberName νμλμ λν μΆκ° μ λ³΄λ₯Ό μλ ₯ν΄ μ£ΌμΈμ.",
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
          title: 'νμ μΆκ° μ±κ³΅',
          content: "νμμ μΆκ° νμ΅λλ€.",
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
