import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/study/detail/study.dart';

class TrainerMainTodoItem extends StatelessWidget {
  final int time;
  final String name;
  final bool isCompleted;
  final int currentStudy;
  final int totalStudy;

  const TrainerMainTodoItem({
    Key? key,
    required this.time,
    required this.name,
    required this.isCompleted,
    required this.currentStudy,
    required this.totalStudy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: smallPadding,
        bottom: smallPadding,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: <Widget>[
            Text(
              '$time시',
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 16,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      isCompleted
                          ? Colors.grey.shade200
                          : colorScheme.primary.withAlpha(20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TrainerStudyDetailView(),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: isCompleted
                            ? Text(
                                '$name 회원님 (완료)',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            : Text(
                                '$name 회원님',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '$currentStudy회차 (총 $totalStudy회차)',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
