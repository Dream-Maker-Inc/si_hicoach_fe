import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/alert.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/information/information.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/study/studying_list.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/detail/tab/header.dart';

class TrainerMemberDetailView extends StatelessWidget {
  const TrainerMemberDetailView({Key? key}) : super(key: key);

  onMemberDeleteIconPressed(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '회원 매칭 취소',
        content:
            '회원 매칭을 취소하시면\n\n - 해당 회원의 예약 수업 정보 모두 삭제\n - 회원 리스트에서 해당 회원 조회 불가\n\n처리됩니다.',
        positiveText: '매칭 취소하기',
        onPositivePressed: () => Navigator.of(context).pop(),
        negativeText: '뒤로',
        onNegativePressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget memberInformation() {
      return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Text(
              '이은석 회원님',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Text(
              '30세 · 남성',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '회원 상세',
        actionsWidget: <Widget>[
          IconButton(
            icon: const SizedBox(
              width: 20,
              child: Icon(Icons.delete_outline),
            ),
            onPressed: () => onMemberDeleteIconPressed(context),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            memberInformation(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const TrainerMemberDetailHeader(),
                  ),
                  body: Column(
                    children: const <Widget>[
                      CustomDivider(),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            TrainerMemberDetailInformation(),
                            TrainerMemberDetailStudyingListView(),
                          ],
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
