import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/text_field.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class MypageEditView extends StatelessWidget {
  const MypageEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '소속 수정',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_rounded,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            TitleWithDescription(
              title: '소속 수정',
              description: '변경된 소속을 입력해 주세요.',
            ),
            SizedBox(height: defaultPadding),
            CustomTextField(hintText: '소속 입력'),
          ],
        ),
      ),
    );
  }
}
