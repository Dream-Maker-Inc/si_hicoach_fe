// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';

class InviteView extends StatelessWidget {
  InviteView({Key? key}) : super(key: key);

  String message =
      '[PT를 더 체계적으로, 하이코치]\n수업 일마다 운동일지를 공유받고 나의 운동 기록을 확인할 수 있어요\n지금 다운받기: (링크)';

  static String kakaoTitle = 'PT를 더 체계적으로, 하이코치';
  static String kakaoDescription = '수업 일마다 운동일지를 공유받고 나의 운동 기록을 확인할 수 있어요';
  static String imageUrl =
      'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png';
  static String downloadUrl = 'https://m.naver.com';

  FeedTemplate kakaoShareTemplate = FeedTemplate(
    content: Content(
      title: kakaoTitle,
      description: kakaoDescription,
      imageUrl: Uri.parse(imageUrl),
      link: Link(
        mobileWebUrl: Uri.parse(downloadUrl),
      ),
    ),
    buttons: [
      Button(
        title: '지금 다운받기',
        link: Link(
          mobileWebUrl: Uri.parse(downloadUrl),
        ),
      ),
    ],
  );

  List<String> recipents = [];

  _handleSendMMSPressed(BuildContext context) async {
    await sendSMS(
      message: message,
      recipients: recipents,
    ).catchError(
      (onError) {
        showMySimpleDialog(
          title: '문자 메시지 전송 오류',
          content: onError,
          context: context,
        );
      },
    );
  }

  _handleShareWithKakao(BuildContext context) async {
    bool isKakaoTalkSharingAvailable =
        await ShareClient.instance.isKakaoTalkSharingAvailable();

    if (isKakaoTalkSharingAvailable) {
      try {
        Uri uri = await ShareClient.instance.shareDefault(
          template: kakaoShareTemplate,
        );

        await ShareClient.instance.launchKakaoTalk(uri);
      } catch (error) {
        showMySimpleDialog(
          context: context,
          title: '카카오톡 공유 실패',
          content: '카카오톡 공유를 실패했습니다.\n오류 : $error',
        );
        Logger().e('카카오톡 공유 실패 $error');
      }
    } else {
      try {
        Uri shareUrl = await WebSharerClient.instance.makeDefaultUrl(
          template: kakaoShareTemplate,
        );
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        Logger().e('카카오톡 공유 실패 $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '친구 초대'),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: List.of(
          <Widget>[
            Column(
              children: [
                ListTile(
                  onTap: () => _handleShareWithKakao(context),
                  title: const Text('카카오톡 초대하기'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                const CustomDivider()
              ],
            ),
            Column(
              children: [
                ListTile(
                  onTap: () => _handleSendMMSPressed(context),
                  title: const Text('메시지로 초대하기'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                const CustomDivider()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
