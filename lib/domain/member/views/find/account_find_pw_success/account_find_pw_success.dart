import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class AccountFindPwSuccessView extends StatelessWidget {
  AccountFindPwSuccessView({Key? key}) : super(key: key);

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
          child: const ContentSection(),
        ),
      ),
    );
  }

  Widget contentSection = Container();
}

class ContentSection extends StatelessWidget {
  const ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('비밀번호 재설정',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                Text('본인 인증이 완료되었습니다.\n새로운 비밀번호를 등록해 주세요.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.4)),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      PwFieldSection(
                          title: '비밀번호',
                          desc: '영문 대문자와 특수문자가 포함된 8자 이상의 비밀번호를 설정해 주세요.'),
                      SizedBox(height: 40),
                      PwFieldSection(
                          title: '비밀번호 확인', desc: '비밀번호를 다시 한 번 입력해 주세요.')
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('비밀번호 변경하기', style: TextStyle(fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    primary: colorScheme.primary,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                )
              ],
            )));
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
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: TextStyle(fontSize: 16)),
          Text(widget.desc, style: TextStyle(fontSize: 12, height: 1.5)),
          SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.primary)),
              labelText: '비밀번호 입력',
            ),
          ),
        ],
      ),
    );
  }
}
