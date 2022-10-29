import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

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
        appBar: const CustomAppBarArrowBack(titleText: '회원 정보 찾기'),
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
