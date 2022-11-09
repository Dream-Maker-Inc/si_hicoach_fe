import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/divider.dart';
import 'package:si_hicoach_fe/domain/common/edit_password/edit_password.dart';
import 'package:si_hicoach_fe/domain/common/invite/invite.dart';
import 'package:si_hicoach_fe/domain/splash/splash.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/account/account.dart';

class MypageMenuView extends StatelessWidget {
  const MypageMenuView({Key? key}) : super(key: key);

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
          leading: const Icon(Icons.person_add_rounded),
          title: const Text('친구 초대'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InviteView(),
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
            ),
          },
        ),
        const CustomDivider(),
      ],
    );
  }
}
