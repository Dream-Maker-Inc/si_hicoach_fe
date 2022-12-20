import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/domain/account/login/views/login.dart';
import 'package:si_hicoach_fe/domain/common/business/business.dart';
import 'package:si_hicoach_fe/domain/common/edit_password/edit_password.dart';
import 'package:si_hicoach_fe/common/invite/invite.dart';
import 'package:si_hicoach_fe/domain/member/views/my/account/account.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/notification.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.face_rounded),
          title: const Text('계정 정보'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AccountView(),
              ),
            )
          },
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('알림 설정'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationView(),
              ),
            )
          },
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.person_add_rounded),
          title: const Text('친구 초대'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InviteView(),
              ),
            )
          },
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.lock_outlined),
          title: const Text('비밀번호 변경'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const EditPasswordView(),
              ),
            )
          },
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.business_outlined),
          title: const Text('사업자 정보'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BusinessView(),
              ),
            )
          },
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: const Text('로그아웃'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            showDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => CustomAlertDialog(
                title: '로그아웃',
                content: '로그아웃 하시겠습니까?',
                positiveText: '로그아웃',
                onPositivePressed: () => {
                  deleteAccessToken(),
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                    (Route<dynamic> route) => false,
                  ),
                },
                negativeText: '취소',
                onNegativePressed: () => Navigator.of(context).pop(),
              ),
            ),
          },
        ),
      ],
    );
  }

  Future deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefsKeys.accessToken.key);
  }
}
