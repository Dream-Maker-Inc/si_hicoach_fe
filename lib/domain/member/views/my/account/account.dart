import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/dialog.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/domain/member/views/my/account/account_vm.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CustomAppBarArrowBack(
        titleText: '계정 정보',
      ),
      body: _buildListView(),
    );
  }

  _buildListView() {
    return Obx(() {
      final columns = vm.columns;

      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
                context: context,
                tiles: columns
                    .map((it) => ListTile(
                        title: Text(it.item1), trailing: Text(it.item2)))
                    .toList())
            .toList(),
      );
    });
  }
}

class _Detail extends MyGetXState<AccountView, AccountPageViewModel> {
  @override
  void initState() {
    super.initState();

    vm.apiError.listen((e) {
      if (e == null) return;

      vm.apiError.value = null;

      showMySimpleDialog(
          context: context,
          title: 'Error',
          content: e.toString(),
          onConfirm: () {
            Get.back();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([vm.fetchData()]);
    });

    return widget;
  }

  @override
  AccountPageViewModel createViewModel() => AccountPageViewModel();
}
