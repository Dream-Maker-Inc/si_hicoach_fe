import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

void main() => runApp(const AccountFindTabView());

class AccountFindTabView extends StatelessWidget {
  const AccountFindTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: TabSection(),
    );
  }
}

class TabSection extends StatelessWidget {
  const TabSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          title: const Text('회원정보 찾기', style: TextStyle(color: Colors.black)),
          leading: const IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: null,
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: colorScheme.onTertiary,
                  ),
                  const TabBar(
                    tabs: <Widget>[
                      Tab(
                        height: 40,
                        child: Text(
                          '아이디 찾기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          '비밀번호 찾기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: <Widget>[IdSection(), PwSection()],
          ),
        ),
      ),
    );
  }
}

class IdSection extends StatelessWidget {
  const IdSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '아이디 (이메일) 찾기',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              '아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: colorScheme.primary,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('휴대폰 인증하기', style: TextStyle(fontSize: 14)),
            )
          ],
        ));
  }
}

class PwSection extends StatelessWidget {
  const PwSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '비밀번호 찾기',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text(
            '회원가입 시 작성하신 아이디를 입력해 주세요.\n본인 확인을 위해 본인 인증을 진행해 주세요.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 40),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
              ),
              labelText: '이메일 입력',
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: colorScheme.primary,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            child: const Text('다음', style: TextStyle(fontSize: 14)),
          )
        ],
      ),
    );
  }
}
