import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/checkbox.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TrainerMemberEditView extends StatefulWidget {
  const TrainerMemberEditView({Key? key}) : super(key: key);

  @override
  State<TrainerMemberEditView> createState() => _TrainerMemberEditViewState();
}

class _TrainerMemberEditViewState extends State<TrainerMemberEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 목표 수정',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check_rounded, color: colorScheme.primary),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const TitleWithDescription(
              title: '운동 목표를 선택해주세요.',
              description: '복수 선택이 가능합니다.',
            ),
            const SizedBox(height: defaultPadding),
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
          ],
        ),
      ),
    );
  }
}
