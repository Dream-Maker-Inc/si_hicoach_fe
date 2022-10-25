import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class AccountFindView extends StatefulWidget {
  const AccountFindView({Key? key}) : super(key: key);

  @override
  State<AccountFindView> createState() => _AccountFindViewState();
}

class _AccountFindViewState extends State<AccountFindView> {
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('찾으실 회원 정보를 선택해 주세요.'),
            SizedBox(height: 20.0),
            FindButton(),
            SizedBox(height: 20.0),
            FindButton()
          ],
        ),
      ),
    );
  }
}

class FindButton extends StatelessWidget {
  const FindButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colorScheme.onTertiary,
      ),
      child: OutlinedButton(
        onPressed: () => {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          side: const BorderSide(width: 0, color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '아이디 (이메일) 찾기',
                  style: Theme.of(context).textTheme.button,
                ),
                const SizedBox(height: 10.0),
                Text(
                  '휴대폰 번호를 통해 아이디 (이메일) 을 찾을 수 있어요.',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
