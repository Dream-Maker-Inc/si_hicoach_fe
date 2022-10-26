import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/alert.dart';
import 'package:si_hicoach_fe/domain/common/app_bar/arrow_back_icon.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/exercise.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/exercise_add.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/memo.dart';
import 'package:si_hicoach_fe/domain/trainer/study/edit/time.dart';

class TrainerStudyEditView extends StatelessWidget {
  const TrainerStudyEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 작성',
        actionsWidget: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              showDialog<String>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => CustomAlertDialog(
                  title: '작성 완료',
                  content: '운동 일지가 정상 등록되었습니다.',
                  positiveText: '확인',
                  onPositivePressed: () => Navigator.of(context).pop(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: <Widget>[
                const TrainerStudyEditTime(),
                const SizedBox(height: widePadding),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 100,
                          child: Text(
                            '운동 일지',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TrainerStudyEditExerciseAdd(),
                            ),
                          ),
                          icon: const Icon(Icons.add_rounded),
                          color: colorScheme.primary,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(70, 103, 240, 0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const TrainerMainEditExercise(),
                    const SizedBox(height: 16),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: colorScheme.onTertiary,
                    ),
                  ],
                ),
                const SizedBox(height: widePadding),
                const TrainerExerciseEditMemo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
