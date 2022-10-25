import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class AccountFindIdSuccessView extends StatefulWidget {
  const AccountFindIdSuccessView({Key? key}) : super(key: key);

  @override
  State<AccountFindIdSuccessView> createState() =>
      _AccountFindIdSuccessViewState();
}

class _AccountFindIdSuccessViewState extends State<AccountFindIdSuccessView> {
  Widget contentSection = Container();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          title: const Text('회원정보 찾기', style: TextStyle(color: Colors.black)),
          leading: const IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: null,
          ),
          elevation: 1,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: const ContentSection(),
          ),
        ),
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
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
            const SizedBox(height: 40),
            Container(
              color: colorScheme.onTertiary,
              height: 60,
              child: const Center(
                child: Text('hicoach', style: TextStyle(fontSize: 16)),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: colorScheme.primary,
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: const Text(
                '로그인 하러 가기',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
