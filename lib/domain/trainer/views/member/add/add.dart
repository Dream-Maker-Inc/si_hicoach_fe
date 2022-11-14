import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/exceptions/common_exceptions.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/add_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/additional_information.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
        child: Obx(() {
          final email = _vm.email.value;
          final validationErrorText = _vm.validationErrorText;

          final submitButtonText = _vm.buttonText;

          final submitButtonPressed =
              !_vm.submitButtonDisabled ? handleSubmitButtonPressed : null;

          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                const TitleWithDescription(
                  title: '회원 아이디 검색',
                  description:
                      '추가하실 회원의 아이디를 검색해 주세요.\n\n하이코치를 통해 다른 트레이너와 매칭된 경우에는 여러 트레이너에게 중복으로 매칭할 수 없어요.',
                ),
                SizedBox(
                  height: 60,
                  child: CustomTextField(
                    hintText: '아이디 (이메일) 입력',
                    keyboardType: TextInputType.emailAddress,
                    suffix: CustomElevatedButton(
                      onPressed: handleIDValidationButtonClicked,
                      text: '검증',
                    ),
                    value: email,
                    onChanged: handleIDInputChanged,
                    errorText: validationErrorText,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: submitButtonPressed,
                    text: submitButtonText,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _Detail extends State<AddView> {
  late TrainerMemberAddViewModel _vm;

  handleIDValidationButtonClicked() {
    _vm.getMember();
  }

  handleIDInputChanged(String value) {
    _vm.email.value = value;
  }

  handleSubmitButtonPressed() {
    if (_vm.isExistMatching) {
      return _vm.recoverMatching(_vm.matchingId);
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AddAdditionalInformation(
          memberId: _vm.memberId,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Get.delete<TrainerMemberAddViewModel>();
    _vm = Get.put(TrainerMemberAddViewModel());

    _vm.getMemberSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showSimpleDialog(
          context: context,
          title: '회원 확인',
          content: _vm.validationSuccessText ?? '');

      _vm.getMemberSuccess.value = false;
    });

    _vm.recoverMatchingSuccess.listen((isSuccess) {
      if (isSuccess == false) return;

      showSimpleDialog(
          context: context,
          title: '매칭 복구',
          content: _vm.recoverSuccessMessage,
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });

      _vm.recoverMatchingSuccess.value = false;
    });

    _vm.apiError.listen((e) {
      if (e == null) return;

      _vm.clear();

      if (e is NotExistException) {
        showSimpleDialog(
            context: context, title: '알림', content: "해당 이메일의 회원이 존재하지 않습니다.");
        return;
      }
      if (e is SameUserException) {
        showSimpleDialog(
            context: context, title: '알림', content: "회원 본인을 검색 하셨습니다.");
        return;
      }

      showSimpleDialog(context: context, title: 'error', content: e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
