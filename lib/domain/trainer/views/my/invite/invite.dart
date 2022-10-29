import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';

class TrainerMypageInviteView extends StatelessWidget {
  const TrainerMypageInviteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '친구 초대'),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.of(
            const <Widget>[
              ListTile(
                title: Text('카카오톡 초대하기'),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                title: Text('메시지로 초대하기'),
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ).toList(),
      ),
    );
  }
}
