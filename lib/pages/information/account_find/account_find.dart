import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/color_schemes.dart';

class AccountFindPage extends StatelessWidget {
  AccountFindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [const TitleSection(), const ContentSection()],
          ),
        ),
      ),
    );
  }

  Widget contentSection = Container();
}

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.onTertiary,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Text(
              '회원 정보 찾기',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
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
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('찾으실 회원 정보를 선택해 주세요.'),
                const SizedBox(height: 20.0),
                const FindButton(),
                const SizedBox(height: 20.0),
                const FindButton()
              ],
            )));
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
            color: colorScheme.onTertiary),
        child: OutlinedButton(
          onPressed: () => {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(16),
            side: BorderSide(width: 0, color: Colors.transparent),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '아이디 (이메일) 찾기',
                      style: Theme.of(context).textTheme.button,
                    ),
                    SizedBox(height: 10.0),
                    Text('휴대폰 번호를 통해 아이디 (이메일) 을 찾을 수 있어요.',
                        style: Theme.of(context).textTheme.caption)
                  ]),
              Icon(Icons.keyboard_arrow_right, color: Colors.black),
            ],
          ),
        ));
  }
}
