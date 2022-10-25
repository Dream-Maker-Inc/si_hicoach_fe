import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class AccountFindIdSuccessView extends StatelessWidget {
  AccountFindIdSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          elevation: 1,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: ContentSection(id: 'hicoach'),
          ),
        ),
      ),
    );
  }

  Widget contentSection = Container();
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
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('아이디 (이메일) 찾기',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                Text('아이디 검색을 위해 휴대폰 인증을 진행해 주세요.',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                SizedBox(height: 40),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorScheme.onTertiary,
                      border: Border.all(width: 1, color: Colors.transparent)),
                  child: Center(
                    child: Text(
                      widget.id,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('로그인 하러 가기', style: TextStyle(fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    primary: colorScheme.primary,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                )
              ],
            )));
    ;
  }
}
