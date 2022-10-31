import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class StudyDetailTime extends StatelessWidget {
  const StudyDetailTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text(
            '수업 시간',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: smallPadding),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: colorScheme.secondary,
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
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: smallPadding,
                right: defaultPadding,
              ),
              child: Text('부터', style: TextStyle(fontSize: 20)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: colorScheme.shadow,
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: smallPadding,
                  right: smallPadding,
                  top: 6,
                  bottom: 6,
                ),
                child: Text('오전 11:50', style: TextStyle(fontSize: 20)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: defaultPadding),
              child: Text('까지', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ],
    );
  }
}
