import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/alert.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/additional_information.dart';

class TrainerMemberAddView extends StatelessWidget {
  const TrainerMemberAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();

    handleIDValidationButtonClicked(BuildContext context) {
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CustomAlertDialog(
          title: '검증 완료',
          content: '등록 가능한 회원입니다.',
          positiveText: '확인',
          onPositivePressed: () => Navigator.of(context).pop(),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: <Widget>[
              const TitleWithDescription(
                title: '회원 아이디 검색',
                description: '추가하실 회원의 아이디를 검색해 주세요.',
              ),
              SizedBox(
                height: 60,
                child: CustomTextField(
                  hintText: '아이디 (이메일) 입력',
                  keyboardType: TextInputType.emailAddress,
                  suffix: CustomElevatedButton(
                    onPressed: () => handleIDValidationButtonClicked(context),
                    text: '검증',
                  ),
                  controller: idController,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const TrainerMemberAddAdditionalInformation(),
                        ),
                      );
                    },
                    text: '다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
