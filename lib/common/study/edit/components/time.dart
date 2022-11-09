import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class EditTime extends StatelessWidget {
  const EditTime({
    Key? key,
    required this.time,
    required this.currentStudy,
    required this.totalStudy,
  }) : super(key: key);

  final int time;
  final int currentStudy;
  final int totalStudy;

  @override
  Widget build(BuildContext context) {
    handleTimePickerTapped() {
      return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dialOnly,
        cancelText: '취소',
        confirmText: '적용',
        errorInvalidText: '시간을 다시 선택해 주세요.',
        hourLabelText: '시',
        minuteLabelText: '분',
        helpText: '회원의 수업 시간을 지정해 주세요.',
      );
    }

    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                '수업 시간',
                style: titleLarge.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '$currentStudy회차 ($totalStudy회)',
                  style: bodySmall.copyWith(
                    color: Colors.grey.shade500,
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
                onTap: handleTimePickerTapped,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 6,
                    bottom: 6,
                  ),
                  child: Text(
                    '$time:00',
                    style: bodySmall.copyWith(color: primaryColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Text('부터', style: bodySmall),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 6,
                  bottom: 6,
                ),
                child: Text('$time:50', style: bodySmall),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('까지', style: bodySmall),
            ),
          ],
        ),
      ],
    );
  }
}
