import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/my_toggle_buttons.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/information/information.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/type/models/member_types.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/type/type_vm.dart';

// 회원 분류 페이지
class SignUpTypeView extends StatefulWidget {
  const SignUpTypeView({super.key});

  @override
  State<SignUpTypeView> createState() => _SignUpTypePageState();
}

class _SignUpTypePageState extends _Detail {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: [
                LinearProgressIndicator(
                  value: 0.6,
                  color: primaryColor,
                  backgroundColor: primaryColor.withAlpha(40),
                ),
                Expanded(
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const TitleWithDescription(
                                  title: '회원 분류',
                                  description: '회원의 종류를 선택해 주세요.',
                                ),
                                _buildToggleButtons(),
                                _buildCompanyInfoSection()
                              ],
                            ),
                            _buildSubmitButton(),
                          ],
                        )))
              ]),
            ),
          ],
        ));
  }

  _buildSubmitButton() {
    return Obx(() {
      final buttonDisabled = vm.buttonDisabled;
      final onClick = !buttonDisabled ? _handleSubmitButtonPressed : null;

      return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(defaultPadding),
          child: CustomElevatedButton(
            onPressed: onClick,
            text: '다음',
          ));
    });
  }

  _buildToggleButtons() {
    return Obx(() {
      final isTrainerPair = vm.isTrainerPair;

      return MyToggleButtons(
        onPressed: _handleMemberTypeChanged,
        borderRadius: BorderRadius.circular(4),
        height: 48,
        isSelected: isTrainerPair,
        color: Colors.grey.shade600,
        children: const [Text('헬스 트레이너'), Text('일반 회원')],
      );
    });
  }

  _buildCompanyInfoSection() {
    return Obx(() {
      final memberType = vm.memberType.value;
      final companyName = vm.companyName.value;
      final isTypeTrainer = memberType == MemberTypes.trainer;

      if (!isTypeTrainer) return Container();

      return Column(
        children: [
          const SizedBox(height: 40),
          const TitleWithDescription(
            title: '헬스장 정보',
            description: '소속 헬스장명을 입력해 주세요.',
          ),
          CustomTextField(
            hintText: '소속 헬스장명을 입력해 주세요.',
            onChanged: _handleCenterNameChanged,
            value: companyName,
          ),
        ],
      );
    });
  }
}

class _Detail extends MyGetXState<SignUpTypeView, SignupTypeViewModel> {
  _handleMemberTypeChanged(int index) {
    vm.handleMemberTypeChange(index);
  }

  _handleCenterNameChanged(String value) {
    vm.companyName.value = value;
  }

  _handleSubmitButtonPressed() {
    vm.saveToSignupViewModel();

    Get.to(const SignUpInformationView());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  SignupTypeViewModel createViewModel() => SignupTypeViewModel();
}
