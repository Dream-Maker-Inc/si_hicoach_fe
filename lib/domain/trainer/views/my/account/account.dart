import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/account/account_vm.dart';
import 'package:si_hicoach_fe/domain/trainer/views/my/account/edit.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends _Detail {
  handleEditClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MypageEditView(companyName: vm.companyName),
      ),
    ).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '계정 정보',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: handleEditClick,
            icon: const Icon(Icons.edit_rounded),
          ),
        ],
      ),
      body: _buildMyInfo(),
    );
  }

  _buildMyInfo() {
    return GetBuilder<MyAccountViewModel>(builder: (builder) {
      final memberName = vm.memberName;
      final memberEmail = vm.memberEmail;
      final birthday = vm.birthday;
      final companyName = vm.companyName;
      final phone = vm.phone;

      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: List.of(
            <Widget>[
              ListTile(title: const Text('이름'), trailing: Text(memberName)),
              ListTile(
                  title: const Text('아이디 (이메일)'), trailing: Text(memberEmail)),
              ListTile(title: const Text('생년월일'), trailing: Text(birthday)),
              ListTile(title: const Text('소속'), trailing: Text(companyName)),
              ListTile(title: const Text('전화번호'), trailing: Text(phone)),
            ],
          ),
        ).toList(),
      );
    });
  }
}

class _Detail extends MyGetXState<AccountView, MyAccountViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      Get.defaultDialog(
          title: 'Error',
          content: Text(e.toString()),
          textConfirm: "뒤로가기",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchMyInfo()]);
    });

    return widget;
  }

  @override
  MyAccountViewModel createViewModel() => MyAccountViewModel();
}
