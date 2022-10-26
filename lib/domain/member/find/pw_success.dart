import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/app_bar/arrow_back_icon.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class MemberFindPwSuccessView extends StatefulWidget {
  const MemberFindPwSuccessView({Key? key}) : super(key: key);

  @override
  State<MemberFindPwSuccessView> createState() =>
      _MemberFindPwSuccessViewState();
}

class _MemberFindPwSuccessViewState extends State<MemberFindPwSuccessView> {
  Widget contentSection = Container();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: CustomAppBarArrowBack(titleText: '회원 정보 찾기'),
        body: SafeArea(child: ContentSection()),
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
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '비밀번호 재설정',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              '본인 인증이 완료되었습니다.\n새로운 비밀번호를 등록해 주세요.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: const <Widget>[
                  PwFieldSection(
                    title: '비밀번호',
                    desc: '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.',
                  ),
                  SizedBox(height: 40),
                  PwFieldSection(
                    title: '비밀번호 확인',
                    desc: '비밀번호를 다시 한 번 입력해 주세요.',
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: colorScheme.primary,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                '비밀번호 변경하기',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PwFieldSection extends StatefulWidget {
  const PwFieldSection({Key? key, required this.title, required this.desc})
      : super(key: key);
  final String title;
  final String desc;

  @override
  State<PwFieldSection> createState() => _PwFieldSectionState();
}

class _PwFieldSectionState extends State<PwFieldSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 16)),
          Text(widget.desc, style: const TextStyle(fontSize: 12, height: 1.5)),
          const SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
              ),
              labelText: '비밀번호 입력',
            ),
          ),
        ],
      ),
    );
  }
}
