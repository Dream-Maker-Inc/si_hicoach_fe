import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/account.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/invite.dart';
import 'package:si_hicoach_fe/domain/member/views/my/my/notification.dart';
import 'package:si_hicoach_fe/domain/member/views/my/password/edit_password.dart';
import 'package:si_hicoach_fe/domain/splash/splash.dart';

class MemberMypageMenuView extends StatelessWidget {
  const MemberMypageMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        tiles: List.of(
          [
            ListTile(
              leading: const Icon(Icons.face_rounded),
              title: const Text('계정 정보'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MemberMypageAccountView(),
                  ),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('알림 설정'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MemberMypageNotificationView(),
                  ),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add_rounded),
              title: const Text('친구 초대'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MemberMypageInviteListView(),
                  ),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock_outlined),
              title: const Text('비밀번호 변경'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MemberMypageEditPasswordView(),
                  ),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_remove_outlined),
              title: const Text('트레이너 매칭 취소'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SplashPage(),
                  ),
                )
              },
            ),
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
        ),
      ).toList(),
    );
  }
}
