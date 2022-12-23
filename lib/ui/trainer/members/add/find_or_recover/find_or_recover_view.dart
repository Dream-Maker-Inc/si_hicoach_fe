import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/components/snackbar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/trainer/members/add/find_or_recover/find_or_recover_vm.dart';
import 'package:si_hicoach_fe/ui/trainer/members/add/matching_create/matching_create_view.dart';

class TrainerMemberFindOrRecoverView extends StatefulWidget {
  const TrainerMemberFindOrRecoverView({super.key});

  @override
  State<TrainerMemberFindOrRecoverView> createState() =>
      _TrainerMemberFindOrRecoverViewState();
}

class _TrainerMemberFindOrRecoverViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const TitleWithDescription(
              title: '회원 아이디 검색',
              description:
                  '추가하실 회원의 아이디를 검색해 주세요.\n\n하이코치를 통해 다른 트레이너와 매칭된 경우에는 여러 트레이너에게 중복으로 매칭할 수 없어요.',
            ),
            _buildEmailField(),
            const Spacer(),
            _buildExistMatchingCaption(),
            _buildSubmitButton(),
          ],
        ),
      )),
    );
  }

  _buildExistMatchingCaption() {
    return Obx(() {
      final isExistPastMatching = vm.isExistPastMatching;

      if (!isExistPastMatching) return Container();

      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '매칭된 이력이 있는 회원입니다.',
                  style: labelMedium.copyWith(color: Colors.grey),
                ),
                Text(
                  '기존 작성된 정보를 기반으로 회원 정보가 복구됩니다.',
                  style: labelMedium.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  _buildSubmitButton() {
    return Obx(() {
      final submitButtonText = vm.isExistMatching ? "매칭 복구" : "다음";

      final submitButtonPressed =
          !vm.submitButtonDisabled ? handleSubmitButtonPressed : null;

      return SizedBox(
        width: double.infinity,
        child: CustomElevatedButton(
          onPressed: submitButtonPressed,
          text: submitButtonText,
        ),
      );
    });
  }

  _buildEmailField() {
    return Obx(() {
      final email = vm.email.value;

      final validationButtonClick =
          vm.submitButtonDisabled ? handleIDValidationButtonClicked : null;

      return SizedBox(
        height: 60,
        child: CustomTextField(
          hintText: '아이디 (이메일) 입력',
          keyboardType: TextInputType.emailAddress,
          suffix: CustomElevatedButton(
            onPressed: validationButtonClick,
            text: '검증',
          ),
          value: email,
          onChanged: handleIDInputChanged,
        ),
      );
    });
  }
}

class _Detail extends MyGetXState<TrainerMemberFindOrRecoverView,
    TrainerMemberFindOrRecoverViewModel> {
  handleIDValidationButtonClicked() {
    vm.fetchMember(vm.email.value);
  }

  handleIDInputChanged(String value) {
    vm.email.value = value;
  }

  handleSubmitButtonPressed() {
    if (vm.isExistMatching) {
      return vm.recoverMatching(vm.matchingId);
    }

    Get.to(
      MatchingCreateView(memberId: vm.memberId),
    );
  }

  @override
  void initState() {
    super.initState();

    vm.memberFetchResponse.listen((res) {
      if (res == null) return;

      if (vm.isExistMatching) {
        return showMySnackBar(
          "알림",
          "(${vm.memberName}님) 이미 매칭되어있는 회원입니다.",
        );
      }

      showMySimpleDialog(
        context: context,
        title: '매칭 가능',
        content: "${vm.memberName}님 확인되었습니다.",
      );
    });

    vm.matchingRecoverSuccess.listen((b) {
      if (!b) return;

      showMySimpleDialog(
          context: context,
          title: '매칭 복구',
          content: "${vm.memberName}님과 다시 매칭 되었습니다.",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });

    vm.apiError.listen((e) {
      if (e == null) return;

      if (e is NotExistException) {
        return showMySnackBar(
          "알림",
          "해당 이메일의 회원이 존재하지 않습니다.",
        );
      }

      if (e is SameUserException) {
        return showMySnackBar(
          "알림",
          "회원 본인을 검색 하셨습니다.",
        );
      }

      showMyHttpErrorDialog(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  TrainerMemberFindOrRecoverViewModel createViewModel() =>
      TrainerMemberFindOrRecoverViewModel();
}
