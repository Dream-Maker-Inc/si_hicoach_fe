import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/chip.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';

class PurposeEditView extends StatelessWidget {
  PurposeEditView({Key? key}) : super(key: key);

  final List<CustomChipProps> list = [
    CustomChipProps(1, '다이어트', true),
    CustomChipProps(2, '산후조리', false),
    CustomChipProps(3, '대회준비', true),
  ];

  _handleChipClick(int id) {
    print('chip click: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 목표 수정',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_rounded,
              color: primaryColor,
            ),
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
              children: List.from(list.map(
                (it) => CustomChip(
                  label: it.label,
                  isChecked: it.isChecked,
                  onPressed: () => _handleChipClick(it.id),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
