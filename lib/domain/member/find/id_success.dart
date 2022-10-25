import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class MemberFindIdSuccessView extends StatefulWidget {
  const MemberFindIdSuccessView({Key? key}) : super(key: key);

  @override
  State<MemberFindIdSuccessView> createState() =>
      _MemberFindIdSuccessViewState();
}

class _MemberFindIdSuccessViewState extends State<MemberFindIdSuccessView> {
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
              color: Colors.white, child: const ContentSection(id: 'hicoach')),
        ),
      ),
    );
  }
}

class ContentSection extends StatefulWidget {
  const ContentSection({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorScheme.onTertiary,
                border: Border.all(width: 1, color: Colors.transparent),
              ),
              child: Center(
                child: Text(
                  widget.id,
                  style: const TextStyle(fontSize: 16),
                ),
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
