import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/http_error_dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/ui/trainer/my-page/account/update/account_update_view.dart';
import 'package:si_hicoach_fe/ui/trainer/my-page/account/detail/account_detail_vm.dart';

class TrainerMyAccountDetailView extends StatefulWidget {
  const TrainerMyAccountDetailView({Key? key}) : super(key: key);

  @override
  State<TrainerMyAccountDetailView> createState() =>
      _TrainerMyAccountDetailViewState();
}

class _TrainerMyAccountDetailViewState extends _Detail {
  handleEditClick() {
    Get.to(TrainerMyAccountUpdateView(companyName: vm.companyName))?.then(
      (_) => vm.refetch(),
    );
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
    return Obx(() {
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
              ListTile(
                title: const Text('이름'),
                trailing: Text(memberName),
              ),
              ListTile(
                title: const Text('아이디 (이메일)'),
                trailing: Text(memberEmail),
              ),
              ListTile(
                title: const Text('생년월일'),
                trailing: Text(birthday),
              ),
              ListTile(
                title: const Text('소속'),
                trailing: Text(companyName),
              ),
              ListTile(
                title: const Text('전화번호'),
                trailing: Text(phone),
              ),
            ],
          ),
        ).toList(),
      );
    });
  }
}

class _Detail extends MyGetXState<TrainerMyAccountDetailView,
    TrainerMyAccountDetailViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      showMyHttpErrorDialog(e.toString()).then((_) => Get.back());
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
  TrainerMyAccountDetailViewModel createViewModel() =>
      TrainerMyAccountDetailViewModel();
}
