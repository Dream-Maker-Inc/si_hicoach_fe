import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';

class TrainerMainHello extends StatefulWidget {
  const TrainerMainHello({Key? key}) : super(key: key);

  @override
  State<TrainerMainHello> createState() => _TrainerMainHelloState();
}

class _TrainerMainHelloState extends State<TrainerMainHello> {
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
            child: Text(
              '반갑습니다, $trainerName 코치님',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
