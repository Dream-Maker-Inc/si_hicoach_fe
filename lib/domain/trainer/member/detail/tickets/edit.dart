import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/alert.dart';
import 'package:si_hicoach_fe/domain/common/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class TrainerMemberDetailTicketsEditView extends StatelessWidget {
  const TrainerMemberDetailTicketsEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '수강권 편집',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => CustomAlertDialog(
                  title: '수강권 편집',
                  content: '수강권 편집이 완료되었습니다.',
                  onPositivePressed: () => Navigator.of(context).pop(),
                  positiveText: '확인',
                ),
              );
            },
            icon: Icon(Icons.check, color: colorScheme.primary),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('PT 총 횟수'),
            SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffix: Text(
                    '회',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                  counterText: '',
                  label: const Text('횟수'),
                ),
                keyboardType: TextInputType.number,
                maxLength: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
