import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';
import 'package:si_hicoach_fe/domain/common/constants.dart';
import 'package:si_hicoach_fe/domain/trainer/member/add/add.dart';
import 'package:si_hicoach_fe/domain/trainer/member/studying/studying_list.dart';

class TrainerMemberListView extends StatelessWidget {
  const TrainerMemberListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원 관리'),
        leading: IconButton(
          icon: const SizedBox(
            width: 20,
            child: Image(image: AssetImage('assets/icon.png')),
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const SizedBox(width: 20, child: Icon(Icons.add_rounded)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const TrainerMemberAddView(),
                ),
              );
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: colorScheme.onTertiary, height: 1),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const <Widget>[
                      Text(
                        '회원 목록',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: smallPadding),
                        child: Text(
                          '총 23명',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                        Tab(text: '수강 중'),
                        Tab(text: '수강 완료'),
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
                    children: [
                      StudyingListView(),
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
