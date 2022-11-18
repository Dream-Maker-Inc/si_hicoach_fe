import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/study/detail/components/exercise.dart';
import 'package:si_hicoach_fe/domain/study/detail/components/memo.dart';
import 'package:si_hicoach_fe/domain/study/detail/components/time.dart';
import 'package:si_hicoach_fe/domain/study/create/study.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/detail.dart';

class StudyDetailView extends StatelessWidget {
  const StudyDetailView({
    Key? key,
    this.isMemberDetailEnabled = true,
  }) : super(key: key);

  final bool? isMemberDetailEnabled;

  @override
  Widget build(BuildContext context) {
    handleEditButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const StudyEditView(),
        ),
      );
    }

    handleDeleteButtonPressed() {
      showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CustomAlertDialog(
          title: '일지 삭제',
          content: '운동 일지를 삭제하시겠습니까?',
          positiveText: '삭제',
          onPositivePressed: () => Navigator.of(context).pop(),
          negativeText: '취소',
          onNegativePressed: () => Navigator.pop(context, true),
        ),
      );
    }

    handleMemberDetailButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailView(memberId: 3),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 상세',
        actionsWidget: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: handleEditButtonPressed,
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: handleDeleteButtonPressed,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '이은석 회원님',
                    style: titleLarge.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  if (isMemberDetailEnabled == true) ...[
                    IconButton(
                      icon: const Icon(Icons.open_in_new_rounded),
                      onPressed: handleMemberDetailButtonPressed,
                      color: Colors.grey,
                    ),
                  ],
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '2022년 9월 30일',
                  style: bodySmall.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              const SizedBox(height: widePadding),
              const DetailTime(),
              const SizedBox(height: widePadding),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '운동 일지',
                      style: titleLarge.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const DetailExercise(
                    title: '푸시업',
                    weight: 12,
                    count: 34,
                    set: 56,
                  ),
                  const SizedBox(height: defaultPadding),
                  const CustomDivider(),
                ],
              ),
              const SizedBox(height: widePadding),
              const DetailMemo(),
            ],
          ),
        ),
      ),
    );
  }
}
