import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/text_field.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class AddAdditionalInformation extends StatelessWidget {
  final List<CustomChipProps> list = [
    CustomChipProps(1, '다이어트', false),
    CustomChipProps(2, '산후조리', false),
    CustomChipProps(3, '대회준비', false),
  ];

  AddAdditionalInformation({Key? key}) : super(key: key);

  _handleChipClick(int id) {
    print('chip click: $id');
  }

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
                const TitleWithDescription(
                  title: '추가 정보 입력',
                  description: '홍길동 회원님에 대한 추가 정보를 입력해 주세요.',
                ),
                const SizedBox(height: widePadding),
                const TitleWithDescription(
                  title: '운동 목표 (선택)',
                  description: '회원님의 운동 목표를 복수 선택해 주세요.',
                ),
                Wrap(
                  children: List.from(list.map(
                    (it) => CustomChip(
                      label: it.label,
                      isChecked: it.isChecked,
                      onPressed: () => _handleChipClick(it.id),
                    ),
                  )),
                ),
                const SizedBox(height: widePadding),
                const TitleWithDescription(
                  title: '메모 (선택)',
                  description: '회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    maxLength: 1000,
                    minLines: 5,
                    maxLines: 100,
                    decoration: InputDecoration(
                      hintText: '회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 4,
                        ),
                      ),
                      counterText: '',
                    ),
                  ),
                ),
                const SizedBox(height: widePadding),
                const TitleWithDescription(
                  title: '총 수강 횟수 (필수)',
                  description:
                      '앱으로 관리하실 회원님의 수강권의 총 횟수를 입력해 주세요.\n이 횟수를 기반으로 잔여 횟수가 차감됩니다.\n\n총 횟수는 언제든지 추가할 수 있어요.',
                ),
                const SizedBox(height: smallPadding),
                const CustomTextField(
                  keyboardType: TextInputType.number,
                  hintText: '총 횟수',
                  suffixText: '회',
                  maxLength: 3,
                ),
                const SizedBox(height: widePadding),
                const TitleWithDescription(
                  title: '완료 수강 횟수 (선택)',
                  description:
                      '회원을 등록하기 전 이미 진행한 수업이 있다면, 완료 수업 횟수를 입력해 주세요.\n입력 시 완료 수강 횟수는 총 횟수에서 자동으로 차감됩니다.',
                ),
                const CustomTextField(
                  keyboardType: TextInputType.number,
                  hintText: '완료 횟수',
                  suffixText: '회',
                  maxLength: 3,
                ),
                const SizedBox(height: widePadding),
                CustomElevatedButton(onPressed: () {}, text: '완료'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
