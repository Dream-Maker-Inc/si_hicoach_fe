import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

void main() => runApp(const AccountFindTabPage());

class AccountFindTabPage extends StatelessWidget {
  const AccountFindTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        // add tabBarTheme
        tabBarTheme: const TabBarTheme(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.blue))),
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
          title: Text('회원정보 찾기',
              style: TextStyle(
                color: Colors.black,
              )),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: null),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
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
        ),
        body: SafeArea(
          child: const TabBarView(
            children: <Widget>[
              IdSection(),
              PwSection(),
            ],
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('아이디 (이메일) 찾기',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Text('아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('휴대폰 인증하기'),
              style: ElevatedButton.styleFrom(
                primary: colorScheme.primary,
                minimumSize: const Size.fromHeight(50), // NEW
              ),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('비밀번호 찾기',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Text('회원가입 시 작성하신 아이디를 입력해 주세요.\n본인 확인을 위해 본인 인증을 진행해 주세요.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            SizedBox(height: 40),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: colorScheme.primary)),
                labelText: '이메일 입력',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('다음'),
              style: ElevatedButton.styleFrom(
                primary: colorScheme.primary,
                minimumSize: const Size.fromHeight(50), // NEW
              ),
            )
          ],
        ));
  }
}
