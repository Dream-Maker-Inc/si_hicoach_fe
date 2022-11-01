import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

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
    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        isCompleted ? Colors.grey.shade200 : colorScheme.primary.withAlpha(20),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevation: MaterialStateProperty.all(0),
    );

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
              style: TextStyle(color: colorScheme.primary, fontSize: 16),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StudyDetailView(),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      '$name 회원님 $currentStudy/$totalStudy (완료)',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
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
