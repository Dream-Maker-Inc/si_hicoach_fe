import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

class DetailTime extends StatelessWidget {
  const DetailTime({Key? key}) : super(key: key);

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
                  '오전 11:00',
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: smallPadding,
                  right: smallPadding,
                  top: 6,
                  bottom: 6,
                ),
                child: Text('오전 11:50', style: bodySmall),
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
