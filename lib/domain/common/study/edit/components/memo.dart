import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class StudyEditMemo extends StatelessWidget {
  const StudyEditMemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          width: double.infinity,
          child: Text(
            '메모',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
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
      ],
    );
  }
}
