import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/find/views/id/find.dart';
import 'package:si_hicoach_fe/domain/account/find/views/pw/find.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class InformationFindView extends StatefulWidget {
  const InformationFindView({Key? key}) : super(key: key);

  @override
  State<InformationFindView> createState() => _InformationFindViewState();
}

class _InformationFindViewState extends State<InformationFindView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('회원정보 찾기'),
          bottom: TabBar(
            padding: EdgeInsets.zero,
            tabs: const <Widget>[
              Tab(text: '아이디 찾기'),
              Tab(text: '비밀번호 찾기'),
            ],
            indicatorColor: colorScheme.primary,
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
            IDFindView(),
            PasswordFindView(),
          ],
        ),
      ),
    );
  }
}
