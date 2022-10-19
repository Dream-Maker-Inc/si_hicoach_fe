import 'package:flutter/material.dart';

class AccountFindPage extends StatelessWidget {
  AccountFindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [const TitleSection()],
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
            color: Theme.of(context).colorScheme.tertiary,
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
