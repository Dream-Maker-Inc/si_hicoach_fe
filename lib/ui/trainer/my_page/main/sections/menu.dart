import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/alert.dart';
import 'package:si_hicoach_fe/common/components/divider.dart';
import 'package:si_hicoach_fe/common/shared_preferences/shared_prefs.dart';
import 'package:si_hicoach_fe/ui/account/login/views/login.dart';
import 'package:si_hicoach_fe/ui/common/business/business.dart';
import 'package:si_hicoach_fe/ui/common/edit_password/edit_password.dart';
import 'package:si_hicoach_fe/common/invite/invite.dart';
import 'package:si_hicoach_fe/ui/trainer/my_page/account/detail/account_detail_view.dart';

class MypageMenuView extends StatelessWidget {
  const MypageMenuView({Key? key}) : super(key: key);

  _handleAccountInfoClick() {
    Get.to(const TrainerMyAccountDetailView());
  }

  _handleFriendInviteClick() {
    Get.to(InviteView());
  }

  _handlePasswordUpdateClick() {
    Get.to(const EditPasswordView());
  }

  _handleBusinessInfoClick() {
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
        onPositivePressed: () => {
          deleteAccessToken(),
          Get.offAll(const LoginView()),
        },
        negativeText: '취소',
        onNegativePressed: () => Get.back(),
      ),
    );
  }

  Future deleteAccessToken() async {
    return SharedPrefsManager().deleteAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.face_rounded),
          title: const Text('계정 정보'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleAccountInfoClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.person_add_rounded),
          title: const Text('친구 초대'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleFriendInviteClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.lock_outlined),
          title: const Text('비밀번호 변경'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handlePasswordUpdateClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.business_outlined),
          title: const Text('사업자 정보'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: _handleBusinessInfoClick,
        ),
        const CustomDivider(),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: const Text('로그아웃'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => _handleLogoutClick(context),
        ),
        const CustomDivider(),
      ],
    );
  }
}
