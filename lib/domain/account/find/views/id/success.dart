import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login/login.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/common/theme/color.dart';

class MemberIDFindSuccessView extends StatefulWidget {
  const MemberIDFindSuccessView({Key? key}) : super(key: key);

  @override
  State<MemberIDFindSuccessView> createState() =>
      _MemberIDFindSuccessViewState();
}

class _MemberIDFindSuccessViewState extends State<MemberIDFindSuccessView> {
  Widget contentSection = Container();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarArrowBack(titleText: '아이디 (이메일) 찾기'),
      body: ContentSection(id: 'hicoach'),
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '아이디 (이메일) 검색 완료',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10),
          Text(
            '인증하신 정보와 일치하는 아이디를 찾았습니다.',
            style: Theme.of(context).textTheme.headline4,
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
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginView()),
                (Route<dynamic> route) => false,
              ),
              text: '로그인 하러 가기',
            ),
          ),
        ],
      ),
    );
  }
}
