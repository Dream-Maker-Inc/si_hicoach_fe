import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/buttons.dart';
import 'package:si_hicoach_fe/domain/common/checkbox.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class TrainerMemberAddAdditionalInformation extends StatelessWidget {
  const TrainerMemberAddAdditionalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원 추가'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '홍길동 회원님에 대한\n추가 정보를 입력해 주세요.',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: widePadding),
                Text(
                  '운동 목표',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: smallPadding),
                Wrap(
                  children: const <Widget>[
                    CustomCheckbox(label: '다이어트'),
                    CustomCheckbox(label: '체형교정'),
                    CustomCheckbox(label: '근력증가'),
                    CustomCheckbox(label: '건강관리'),
                    CustomCheckbox(label: '기초체력향상'),
                    CustomCheckbox(label: '스트레스해소'),
                    CustomCheckbox(label: '산후체형관리'),
                    CustomCheckbox(label: '운동방법체득'),
                    CustomCheckbox(label: '대회준비'),
                    CustomCheckbox(label: '바이프로필'),
                  ],
                ),
                const SizedBox(height: widePadding),
                Text(
                  '메모',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: defaultPadding),
                    child: TextField(
                      maxLength: 1000,
                      minLines: 5,
                      maxLines: 100,
                      decoration: InputDecoration(
                        hintText: '예정/오늘 수업에 대한 정보를 기록해주세요.',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: widePadding),
                Text(
                  'PT 수강권',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: smallPadding),
                ListTile(
                  title: const Text('PT 총 횟수'),
                  trailing: SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 4,
                          ),
                        ),
                        hintText: '횟수',
                        suffixText: '회',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: widePadding),
                SizedBox(
                  child: CustomElevatedButton(onPressed: () {}, text: '완료'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
