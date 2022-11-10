import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/information/information.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/data/models/member_types.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/type/type_vm.dart';

class SignUpTypeView extends StatefulWidget {
  const SignUpTypeView({super.key});

  @override
  State<SignUpTypeView> createState() => _SignUpTypePageState();
}

class _SignUpTypePageState extends State<SignUpTypeView> {
  late SignupTypeViewModel _vm;

  _handleMemberTypeChanged(MemberTypes? value) {
    _vm.memberType.value = value ?? MemberTypes.normal;
  }

  _handleCenterNameChanged(String value) {
    _vm.companyName.value = value;
  }

  _handleSubmitButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpInformationView(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Get.delete<SignupTypeViewModel>();
    _vm = Get.put(SignupTypeViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
        body: Obx(
          () {
            final memberType = _vm.memberType.value;
            final buttonDisabled = _vm.buttonDisabled;

            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        value: 0.6,
                        color: primaryColor,
                        backgroundColor: primaryColor.withAlpha(40),
                      ),
                      Container(
                        margin: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          children: <Widget>[
                            const TitleWithDescription(
                              title: '회원 분류',
                              description: '회원의 종류를 선택해 주세요.',
                            ),
                            RadioListTile<MemberTypes>(
                              title: const Text('헬스 트레이너'),
                              value: MemberTypes.trainer,
                              groupValue: memberType,
                              onChanged: _handleMemberTypeChanged,
                            ),
                            RadioListTile<MemberTypes>(
                              title: const Text('일반 회원'),
                              value: MemberTypes.normal,
                              groupValue: memberType,
                              onChanged: _handleMemberTypeChanged,
                            ),
                            if (memberType == MemberTypes.trainer)
                              ..._buildCompanyInfoSection(),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(defaultPadding),
                        child: CustomElevatedButton(
                          onPressed: !buttonDisabled
                              ? _handleSubmitButtonPressed
                              : null,
                          text: '다음',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }

  _buildCompanyInfoSection() {
    final companyName = _vm.companyName.value;

    return [
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
    ];
  }
}
