import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/additional_information.dart';

class AddView extends StatelessWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleIDValidationButtonClicked() {
      print('검증');
    }

    handleIDInputChanged(String value) {
      print('ID : $value');
    }

    handleSubmitButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => AddAdditionalInformation(),
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
                  onChanged: handleIDInputChanged,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: handleSubmitButtonPressed,
                  text: '다음',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
