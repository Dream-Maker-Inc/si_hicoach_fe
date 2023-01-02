import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/ui/common/study/detail/detail.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/ui/trainer/home/main_vm.dart';

class TrainerMainTodoItemModel {
  final int studyId;
  final int time;
  final String name;
  final bool isCompleted;
  final int studyCount;
  final int totalTicketCount;
  final bool isPersonal;

  TrainerMainTodoItemModel({
    required this.studyId,
    required this.time,
    required this.name,
    required this.isCompleted,
    required this.studyCount,
    required this.totalTicketCount,
    required this.isPersonal,
  });
}

class TrainerMainTodoItem extends StatelessWidget {
  final TrainerMainTodoItemModel model;

  TrainerMainTodoItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final vm = Get.find<TrainerMainViewModel>();

  handleItemPressed(BuildContext context) {
    Get.to(StudyDetailView(
      studyId: model.studyId,
    ))?.then((_) => vm.refetch());
  }

  @override
  Widget build(BuildContext context) {
    final int time = model.time;
    final String name = model.name;
    final bool isCompleted = model.isCompleted;
    final int currentStudy = model.studyCount;
    final int totalStudy = model.totalTicketCount;
    final String userType = model.isPersonal ? "코치님" : "회원님";

    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        isCompleted ? Colors.grey.shade200 : primaryColor.withAlpha(20),
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
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              '$time시',
              style: bodyLarge,
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () => handleItemPressed(context),
                child: ListTile(
                  title: Text(
                    '$name $userType',
                    style: titleMedium.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  subtitle: Text(
                    '$currentStudy회 진행 · 총 $totalStudy회',
                    style: bodySmall.copyWith(
                      color: Colors.grey.shade500,
                    ),
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
    );
  }
}
