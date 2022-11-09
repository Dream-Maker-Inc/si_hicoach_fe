import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class MemoEditView extends StatelessWidget {
  const MemoEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '메모 수정',
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
        height: 100,
        margin: const EdgeInsets.all(defaultPadding),
        child: TextFormField(
          maxLength: 1000,
          minLines: 5,
          maxLines: 100,
          decoration: InputDecoration(
            counterText: '',
            hintText: '회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 4,
              ),
            ),
          ),
          initialValue: '회원님에 대해 기억해야 할 사항을 자유롭게 기록하세요.',
        ),
      ),
    );
  }
}
