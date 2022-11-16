import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';

class InviteView extends StatelessWidget {
  InviteView({Key? key}) : super(key: key);

  String message =
      '[PT를 더 체계적으로, 하이코치]\n수업 일마다 운동일지를 공유받고 나의 운동 기록을 확인할 수 있어요\n지금 다운받기: (링크)';

  List<String> recipents = [];

  _handleSendMMSPressed(BuildContext context) async {
    await sendSMS(
      message: message,
      recipients: recipents,
    ).catchError(
      (onError) => showSimpleDialog(
        title: '문자 메시지 전송 오류',
        content: onError,
        context: context,
      ),
    );
  }

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
            <Widget>[
              ListTile(
                onTap: () => _handleSendMMSPressed(context),
                title: const Text('카카오톡 초대하기'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () => _handleSendMMSPressed(context),
                title: const Text('메시지로 초대하기'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ).toList(),
      ),
    );
  }
}
