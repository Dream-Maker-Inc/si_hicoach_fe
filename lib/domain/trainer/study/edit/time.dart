import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class TrainerStudyEditTime extends StatelessWidget {
  const TrainerStudyEditTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Row(
            children: const <Widget>[
              Text(
                '수업 시간',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '4회차 (10회)',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(70, 103, 240, 0.1),
              ),
              child: InkWell(
                onTap: () => {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dialOnly,
                    cancelText: '취소',
                    confirmText: '적용',
                    errorInvalidText: '시간을 다시 선택해 주세요.',
                    hourLabelText: '시',
                    minuteLabelText: '분',
                    helpText: '회원의 수업 시간을 지정해 주세요.',
                  ),
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 6,
                    bottom: 6,
                  ),
                  child: Text(
                    '오전 11:00',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Text(
                '부터',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(70, 103, 240, 0.1),
              ),
              child: InkWell(
                onTap: () => {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dialOnly,
                    cancelText: '취소',
                    confirmText: '적용',
                    errorInvalidText: '시간을 다시 선택해 주세요.',
                    hourLabelText: '시',
                    minuteLabelText: '분',
                    helpText: '회원의 수업 시간을 지정해 주세요.',
                  ),
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 6,
                    bottom: 6,
                  ),
                  child: Text(
                    '오전 11:50',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('까지', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ],
    );
  }
}
