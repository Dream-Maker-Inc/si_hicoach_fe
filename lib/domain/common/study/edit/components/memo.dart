import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/common/theme/typography.dart';

class EditMemo extends StatelessWidget {
  const EditMemo({Key? key, required this.memo}) : super(key: key);
  final String memo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text('메모', style: titleLarge),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
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
                counterText: '',
              ),
              initialValue: memo,
            ),
          ),
        ),
      ],
    );
  }
}
