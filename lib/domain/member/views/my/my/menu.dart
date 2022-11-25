import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/edit_password/edit_password.dart';
import 'package:si_hicoach_fe/common/invite/invite.dart';
import 'package:si_hicoach_fe/domain/member/views/my/account/account.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/notification.dart';
import 'package:si_hicoach_fe/domain/splash/splash.dart';

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
          leading: const Icon(Icons.logout_rounded),
          title: const Text('로그아웃'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            )
          },
        ),
      ],
    );
  }
}
