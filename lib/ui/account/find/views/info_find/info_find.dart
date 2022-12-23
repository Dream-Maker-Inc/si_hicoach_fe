import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/ui/account/find/views/id/find.dart';
import 'package:si_hicoach_fe/ui/account/find/views/pw/find.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/common/theme/typography.dart';

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
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.black,
            labelStyle: labelLarge,
            unselectedLabelStyle: labelLarge.copyWith(
              fontWeight: FontWeight.w400,
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
