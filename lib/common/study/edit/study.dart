import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/study/edit/components/exercise.dart';
import 'package:si_hicoach_fe/common/study/edit/components/time.dart';
import 'package:si_hicoach_fe/common/study/edit/components/memo.dart';

class StudyProps {
  final String name;
  final int weight;
  final int count;
  final int set;

  StudyProps(this.name, this.weight, this.count, this.set);
}

class StudyEditView extends StatelessWidget {
  StudyEditView({Key? key}) : super(key: key);

  final List<StudyProps> list = [
    StudyProps('벤치프레스', 10, 20, 30),
    StudyProps('푸쉬업', 20, 30, 40),
    StudyProps('윗몸', 30, 40, 50),
    StudyProps('벤치프레스', 10, 20, 30),
  ];

  final String memo = '메모!';

  handleSubmitButtonPressed() {
    print('submit');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 작성',
        actionsWidget: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: handleSubmitButtonPressed,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                const EditTime(time: 11, currentStudy: 4, totalStudy: 10),
                const SizedBox(height: widePadding),
                EditExercise(list: list),
                const SizedBox(height: defaultPadding),
                const CustomDivider(),
                const SizedBox(height: widePadding),
                EditMemo(memo: memo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
