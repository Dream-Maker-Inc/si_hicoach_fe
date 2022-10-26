import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/member/detail/information/information.dart';
import 'package:si_hicoach_fe/domain/trainer/member/studying/studying_list.dart';

class TrainerMemberDetailView extends StatelessWidget {
  const TrainerMemberDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '회원 상세',
        actionsWidget: <Widget>[
          IconButton(
            icon: const SizedBox(width: 20, child: Icon(Icons.delete_outline)),
            onPressed: () {},
          )
        ],
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  top: defaultPadding,
                ),
                child: Text(
                  '이은석 회원님',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: defaultPadding),
              child: Text(
                '30세 · 남성',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    bottom: TabBar(
                      tabs: const <Widget>[
                        Tab(text: '회원 정보'),
                        Tab(text: '운동 일지'),
                      ],
                      labelColor: colorScheme.primary,
                      unselectedLabelColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  body: const TabBarView(
                    children: <Widget>[
                      TrainerMemberDetailInformation(),
                      StudyingListView(),
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
