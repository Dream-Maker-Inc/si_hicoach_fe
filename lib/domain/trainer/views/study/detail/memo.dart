import 'package:flutter/material.dart';

class TrainerExerciseDetailMemo extends StatelessWidget {
  const TrainerExerciseDetailMemo({Key? key}) : super(key: key);

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
          child: Text(
            '안녕하세요',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
