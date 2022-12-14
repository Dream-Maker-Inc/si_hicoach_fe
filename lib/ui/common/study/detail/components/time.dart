import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class DetailTime extends StatelessWidget {
  final String startedTime;
  final String endedTime;
  const DetailTime(
      {super.key, required this.startedTime, required this.endedTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text(
            '수업 시간',
            style: titleLarge.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
        ),
        const SizedBox(height: smallPadding),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: secondaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: smallPadding,
                  right: smallPadding,
                  top: 6,
                  bottom: 6,
                ),
                child: Text(
                  startedTime,
                  style: bodySmall.copyWith(color: primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: smallPadding,
                right: defaultPadding,
              ),
              child: Text('부터', style: bodySmall),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(70, 103, 240, 0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: smallPadding,
                  right: smallPadding,
                  top: 6,
                  bottom: 6,
                ),
                child: Text(
                  endedTime,
                  style: bodySmall.copyWith(color: primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: Text('까지', style: bodySmall),
            ),
          ],
        ),
      ],
    );
  }
}
