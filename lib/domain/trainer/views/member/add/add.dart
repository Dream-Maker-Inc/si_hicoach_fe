import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/add/additional_information.dart';

class TrainerMemberAddView extends StatelessWidget {
  const TrainerMemberAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();

    handleIDValidationButtonClicked() {
      print('clicked');
    }

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const TitleWithDescription(
              title: '회원 아이디 검색',
              description: '추가하실 회원의 아이디를 검색해 주세요.',
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 70,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: '아이디 (이메일) 입력',
                    labelText: '아이디 (이메일) 입력',
                    suffix: TextButton(
                      onPressed: handleIDValidationButtonClicked,
                      child: const Text('검증'),
                    ),
                  ),
                  controller: idController,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(defaultPadding),
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
    );
  }
}
