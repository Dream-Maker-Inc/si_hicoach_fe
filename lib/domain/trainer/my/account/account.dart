import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';

class TrainerMypageAccountView extends StatelessWidget {
  const TrainerMypageAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '계정 정보',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.of(
            const <Widget>[
              ListTile(title: Text('이름'), trailing: Text('이은석')),
              ListTile(title: Text('아이디 (이메일)'), trailing: Text('이은석')),
              ListTile(title: Text('생년월일'), trailing: Text('이은석')),
              ListTile(title: Text('소속'), trailing: Text('이은석')),
              ListTile(title: Text('전화번호'), trailing: Text('이은석')),
            ],
          ),
        ).toList(),
      ),
    );
  }
}
