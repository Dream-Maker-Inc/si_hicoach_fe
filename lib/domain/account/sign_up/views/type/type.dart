import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/my_toggle_buttons.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
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

  _handleMemberTypeChanged(int index) {
    _vm.handleMemberTypeChange(index);
  }

  _handleCenterNameChanged(String value) {
    _vm.companyName.value = value;
  }

  _handleSubmitButtonPressed() {
    _vm.save();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpInformationView(),
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
            final isTrainerPair = _vm.isTrainerPair;
            final buttonDisabled = _vm.buttonDisabled;

            return CustomScrollView(
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
                                    MyToggleButtons(
                                      onPressed: _handleMemberTypeChanged,
                                      borderRadius: BorderRadius.circular(4),
                                      height: 48,
                                      isSelected: isTrainerPair,
                                      color: Colors.grey.shade600,
                                      children: const [
                                        Text('헬스 트레이너'),
                                        Text('일반 회원')
                                      ],
                                    ),
                                    if (memberType == MemberTypes.trainer)
                                      ..._buildCompanyInfoSection(),
                                  ],
                                ),
                                Container(
                                    width: double.infinity,
                                    margin:
                                        const EdgeInsets.all(defaultPadding),
                                    child: CustomElevatedButton(
                                      onPressed: !buttonDisabled
                                          ? _handleSubmitButtonPressed
                                          : null,
                                      text: '다음',
                                    )),
                              ],
                            )))
                  ]),
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
