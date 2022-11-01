import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/alert.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/exercise.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/memo.dart';
import 'package:si_hicoach_fe/domain/common/study/detail/time.dart';
import 'package:si_hicoach_fe/domain/common/study/edit/study.dart';

class StudyDetailView extends StatelessWidget {
  const StudyDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '운동 일지 상세',
        actionsWidget: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StudyEditView(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
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
            },
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
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  IconButton(
                    icon: const Icon(Icons.open_in_new_rounded),
                    onPressed: () {},
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '2022년 9월 30일',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const SizedBox(height: widePadding),
              const StudyDetailTime(),
              const SizedBox(height: widePadding),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '운동 일지',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const StudyDetailExercise(
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
              const StudyDetailMemo(),
            ],
          ),
        ),
      ),
    );
  }
}
