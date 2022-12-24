import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login.dart';
import 'package:si_hicoach_fe/ui/common/business/business.dart';
import 'package:si_hicoach_fe/ui/common/edit_password/edit_password.dart';
import 'package:si_hicoach_fe/common/invite/invite.dart';
import 'package:si_hicoach_fe/domain/member/views/my/account/account.dart';
import 'package:si_hicoach_fe/ui/member/my_page/notification/notification_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  _handleAccountMenuClick() {
    Get.to(const AccountView());
  }

  _handleNotificationMenuClick() {
    Get.to(const MemberNotificationView());
  }

  _handlePasswordMenuClick() {
    Get.to(const EditPasswordView());
  }

  _handleFriendInviteMenuClick() {
    Get.to(InviteView());
  }

  _handleBusinessInfoMenuClick() {
    Get.to(const BusinessView());
  }

  _handleLogoutClick(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CustomAlertDialog(
        title: '로그아웃',
        content: '로그아웃 하시겠습니까?',
        positiveText: '로그아웃',
        onPositivePressed: () {
          deleteAccessToken();
          Get.offAll(const LoginView());
        },
        negativeText: '취소',
        onNegativePressed: () => Get.back(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.face_rounded),
          title: const Text('계정 정보'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleAccountMenuClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('알림 설정'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleNotificationMenuClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.person_add_rounded),
          title: const Text('친구 초대'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleFriendInviteMenuClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.lock_outlined),
          title: const Text('비밀번호 변경'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handlePasswordMenuClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.business_outlined),
          title: const Text('사업자 정보'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleBusinessInfoMenuClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: const Text('로그아웃'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => _handleLogoutClick(context),
        ),
      ],
    );
  }

  Future deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPrefsKeys.accessToken.key);
  }
}
