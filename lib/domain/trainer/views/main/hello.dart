import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';

class MemberMainHello extends StatefulWidget {
  const MemberMainHello({Key? key}) : super(key: key);

  @override
  State<MemberMainHello> createState() => _TrainerMainHelloState();
}

class _TrainerMainHelloState extends State<MemberMainHello> {
  String trainerName = '은석';

  DateTime now = DateTime.now();

  DateFormat formatter = DateFormat('yyyy년 MM월 dd일');

  late String formattedDate = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: defaultPadding,
              top: defaultPadding,
            ),
            child: Wrap(
              children: <Widget>[
                Text(
                  '반갑습니다, $trainerName 코치님',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            top: smallPadding,
          ),
          child: Text(
            formattedDate,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
